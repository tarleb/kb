---
title: Introduction to Pandoc Custom Writers
date: 2023-02-15
---

[Pandoc](https://www.pandoc.org) is a piece of software that converts
documents from one format to another. It natively handles a huge number
of formats, and has good documentation. But what if you have some custom
format that Pandoc doesn\'t natively handle?

Pandoc is extensible, and you can write custom readers and writers in
[Lua](https://www.lua.org/). But here, I didn\'t find the same level of
documentation, and getting started was very difficult.

I was able to get generous personal help from one of the core
developers; I don\'t know if I could have figured it out on my own. My
hope is that this introduction can help you get to the point where the
documentation makes sense, and allows you to independently construct
custom filters and writers for Pandoc.

# Understanding the AST

Pandoc parses all documents into an abstract syntax tree (AST); from
there, the content can be filtered, and documents can be written in any
format.

::: center
![image](aux/flowchart.png){style="height:20cm"}
:::

To understand how an AST works, it is easiest to take a look at one.
Suppose we have a document that looks as follows:

::: center
![image](aux/silly.png)
:::

If this document is written in LaTeX, for example (the whole point of
pandoc is that the format doesn\'t matter---but download the LaTeX
[here](aux/silly.tex) to play along), the following command would yield
the AST:

    $ pandoc --from=latex --to=native silly.tex

And here it is:

    1   [ Header
    2       1
    3       ( "a-silly-joke" , [] , [] )
    4       [ Str "A" , Space , Str "Silly" , Space , Str "Joke" ]
    5   , Para
    6       [ Str "I\8217m"
    7       , Space
    8       , Span ( "" , [] , [] ) [ Strong [ Str "concerned" ] ]
    9       , Space
    10      , Str "for"
    11      , Space
    12      , Str "the"
    13      , Space
    14      , Str "calendar"
    15      , Note
    16          [ Para
    17              [ Str "Its"
    18              , Space
    19              , Str "days"
    20              , Space
    21              , Str "are"
    22              , Space
    23              , Span ( "" , [] , [] ) [ Emph [ Str "numbered" ] ]
    24              , Str "."
    25              ]
    26          ]
    27      , Str "."
    28      ]
    29  ]

On line 1, we have the `Header` constructor. It is a level 1 header
(line 2), and has a name assigned to it (line 3) as well as text (line
4). Note that the text consists of `Str` constructors---a separate
string for each word---with `Space` constructors in between them.

We then have the `Para` constructor for a paragraph on line 5. Inside
the paragraph, the first string, \"I\'m\", involves an apostrophe.
Through the `smart` extension (it runs by default for LaTeX; don\'t
worry about it right now), pandoc puts quotes and apostrophes in the
appropriate directions with UTF-8 symbols. Note that 8217 is the
*decimal* value of UTF-8 code for the symbol.

We then see a `Span` constructor on line 8, much like in HTML,
encompassing formatted text. The formatting itself---the bold text---is
given by the `Strong` constructor, acting on the string shown.

On line 15 we see the `Note` constructor for the footnote. The footnote
is its own paragraph. The italics in the footnote are represented by the
`Emph` constructor on line 23.

# Filters

Suppose we want to change all header levels, setting them one higher
than before. Checking with the [Lua type
reference](https://pandoc.org/lua-filters#lua-type-reference), we find
that `Header` has seven attributes: `level`, `content`, `attr`,
`indentifier`, `classes`, `attributes`, and `tag,t`. Since we\'re trying
to change the level, we want `level`, and the fact that its type is
integer should make sense. At this point, we can write a file with the
following contents:

    function Header (h)
      h.level = h.level + 1
      return h
    end

Save that file as `headers.lua`. Note that here, `Header` is a
*function*, and its argument, `h`, is, in fact, a header. This can get
confusing. What this filter does is it uses the *function*
`Header`---the name is how it determines that this function operates on
headers---to take in one header after another and change its level. To
run this filter and examine the resulting modified AST, type the
following:

    $ pandoc --lua-filter headers.lua --from=latex --to=native silly.tex

The `--lua-filter` flag can also be applied as `-L`.

Now suppose we don\'t like the fancy UTF-8 apostrophes and want just a
\"normal\" ASCII apostrophe. Looking in the type reference, `Str` has
the attribute `text`, which is a string with its content. We can then
write the following code:

    function Str (s)
      s.text=s.text:gsub('\u{2019}', "'")
      return s
    end

Save that file as `apostrophe.lua`. We define the function `Str`. By its
name, we know that it will operate on every `Str` constructor; each of
them will take its turn being the argument `s`. The function simply
returns the string, substituting the regular apostrophe for the fancy
apostrophe. Please note we used the *hexadecimal* value of the UTF-8
code this time. The `gsub` function is a native Lua function and is
described in the book [Programming in
Lua](https://www.lua.org/pil/20.1.html). The more familiar you are with
Lua, the more powerful your filters, readers and writers can be.

When demonstrating this, we should also observe that pandoc can read
from STDIN. It is silly in our current case, but we could apply this
filter as follows:

    $ cat silly.tex | pandoc --lua-filter=apostrophe.lua --from=latex --to=native

Or, of course, we could do what we did last time.

# Writers

A writer is like a filter, but instead of returning a modified AST, it
needs to return a document. This means that every function needs to
return a string. (For binary formats, we would need a different function
called `ByteStringWriter`, not covered in this introduction.) All
writers have a lot in common, and there is a lot of boilerplate code
involved in creating one. The function `pandoc.scaffolding.Writer`
contains all this boilerplate code, and we can redefine the render
functions inside it as necessary, so it makes sense to start our writer
with the line

    Writer = pandoc.scaffolding.Writer

## Inline Functions

Now we can think about how we want to write strings. Do we want to
change apostrophes as we did in our filter? Then we can put the same
function here as `Writer.Inline.Str`. But for the time being, let\'s say
we just want to put the strings into the text as they are. We can then
define the function as follows:

    Writer.Inline.Str = function (str)
      return str.text
    end

Or, suppose our document has instances of `{{name}}` and we want to
replace every instance with the name \"Jimmy.\" Then we could write

    Writer.Inline.Str = function (str)
      if str.text == "{{name}}" then
        return "Jimmy"
      else
        return str.text
      end
    end

This demonstrates why it can be so helpful to have each word stored as a
separate string in the AST.

Now suppose that when we see the `Emph` constructor, we want to put the
contents in HTML `<i>` italic tags. (It would generally be better to use
`<em>` tags, but never mind that for our demonstration.) Looking in the
type reference, we see that `Emph` has the field `content` and its type
is `Inlines`. So we can write the following code:

    Writer.Inline.Emph = function (em)
      return "<i>" .. Writer.Inlines(em.content) .. "</i>"
    end

This returns the string we need. Could you construct a similar writer
function that would render the contents of a `Strong` constructor as
bold HTML?

Looking at the `Space` constructor in the type reference, it has no
fields except `tag` (which is just a string literal of the name of the
constructor). If we want to just render spaces as spaces, we can write
the function

    Writer.Inline.Space = ' '

We could also render spaces differently, depending on the destination of
our output.

For the `Span` constructor, let\'s say we just want to return its
content, given by its `content` field, of type `Inlines`. We can write
that function as follows:

    Writer.Inline.Span = function(s)
      return Writer.Inlines(s.content)
    end

The `Link` constructor is for hyperlinks. It has, among others, the
fields `content`---the text of the link---and `target`---the URI for the
link. Both are strings. Could you write a function to render links as
HTML hyperlinks?

## Block Functions

Block functions are not particularly different for our purposes. Let us
look back at the `Header` constructor. We have already worked with its
`level` field, but it also, of course, has a `content` field of type
`Inlines`. Because Lua allows the concatenation of integers into
strings, we could render a header in HTML very simply as follows:

    Writer.Block.Header = function(h)
      return "<h"..h.level..">"..Writer.Inlines(h.content).."</h>"
    end

The constructors `Para` (paragraph) and `Plain` are fairly simple
constructors, with only `content` fields. If we\'re generating output
meant to be read as a text file, we could just output their contents
with no modification:

    Writer.Block.Para = function (p)
      return Writer.Inlines(p.content)
    end

    Writer.Block.Plain = function(b)
      return Writer.Inlines(b.content)
    end

On the other hand, in HTML, it might make sense to enclose a paragraph
in `<p>` tags.

The `BlockQuote` constructor has only `content` and `tag` fields. Could
you write code to render a blockquote in HTML?

## Putting It Together

The `Pandoc` constructor represents the entire document. Its attributes
are `blocks`, of type `Blocks`, which is the contents of the entire
document; and `meta`, of type `Meta`, which we won\'t go into right now.
To output the document, we can define the function as follows:

    Writer.Pandoc = function (doc)
      return Writer.Blocks(doc.blocks)
    end

## A More Advanced Example

We have largely been simply taking the contents and dumping them into
strings. Occasionally, we have been slightly modifying the text of the
strings. Let us give a marginally more advanced example: we will collect
the footnotes, leaving just numbers in the text where we found them;
then we will put all the footnotes, corresponsingly numbered, at the
bottom of the document. We will assume a basic understanding of Lua.

The `Note` constructor has only the `content` attribute, of type
`Block`. But when our code sees a `Note` in the AST, we don\'t want to
return the content; we want to just keep track of the number and return
the number (in square brackets, let\'s say). We then want to store the
content in an array and save it for the end. Thus, early in the writer
file, we can declare an empty array:

    local footnotes={}

In the function, we will append the content to the array. The array
actually holds our current footnote number automatically---that\'s its
length. So we can use that number as the one we return into the inline
text.

    Writer.Inline.Note = function(n)
      footnotes[#footnotes+1]=n.content
      local num=#footnotes
      return string.format("[%d]",num)
    end

Now, when we call `Writer.Pandoc`, we want to output the document
contents, and then the contents of the footnotes. That\'s almost all we
need to do, but we also want to make sure the footnotes are
correspondingly numbered. In order to number them, we loop through the
array, and put in the numbers and text into a new array that contains
them exactly as we want them. Finally, we return the document with the
notes appended at the end.

We assign the document a variable name at the beginning of the function.
This is because if we don\'t do that, the document will not be evaluated
yet when we are reading the footnote array; if the document is not
evaluated, the array will not yet be populated.

    Writer.Pandoc = function (doc)
      local d = Writer.Blocks(doc.blocks)
      local notes = {}
      for i,f in ipairs(footnotes) do
        local note = string.format("[%d] ",i)  .. " " .. Writer.Blocks(f)
        table.insert(notes, note)
      end
      return {d, '\n\n' ,pandoc.layout.concat(notes, '\n')}
    end

We use pandoc\'s `concat` function for an easy way to join the `notes`
array together into a single string.

# Using A Writer {#using-the-writer}

Once we\'re ready, supposing our writer is saved as `writer.lua`, we can
run the writer with

    $ pandoc --from=latex --to=writer.lua file.tex

Of course, we can now read in a file in any format, not just LaTeX, and
write the content with our writer.

[![Creative Commons
License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png){style="border-width:0"}](http://creativecommons.org/licenses/by-sa/4.0/){rel="license"}\
This work is licensed under a [Creative Commons Attribution-ShareAlike
4.0 International
License](http://creativecommons.org/licenses/by-sa/4.0/){rel="license"}.
