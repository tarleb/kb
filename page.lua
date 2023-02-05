-- Parameters
local tips_dir = arg[1] or 'tips'

local ls = pandoc.system.list_directory
local join = pandoc.path.join

local css = [[
<style>
.tip {
  padding-top: 1em;
  padding-bottom: 1em;
}
.tip + .tip {
  border-top: solid #222 1px;
  padding-bottom: 1em;
}
.tag {
  background-color: #b8b8b8;
  border-radius: 0.75ex;
  display: inline-block;
  padding: 0.33ex 1ex;
  margin-right: 1ex;
}
</style>
]]

local function tag_span (tip)
  return pandoc.Span(tip, {class='tag'})
end

local function readtip (filepath)
  local fh <close> = io.open(filepath, 'r')
  -- local fh = io.open(filepath, 'r')
  local doc = pandoc.read(fh:read('a'))
  if pandoc.utils.type(doc.meta.tags) == 'List' then
    doc.blocks:insert(
      1,
      pandoc.Div(
        pandoc.Plain(doc.meta.tags:map(tag_span)),
        {class='tags'}
      )
    )
  end
  if doc.meta.title then
    doc.blocks:insert(
      1,
      pandoc.Header(2, doc.meta.title)
    )
  end
  return pandoc.Blocks(
    pandoc.Div(doc.blocks, {class='tip'})
  )
end

local meta = {
  title = pandoc.Inlines('Pandoc Tips'),
  author = pandoc.Inlines('Albert Krewinkel, Ilona Silverwood'),
  ['header-includes'] = {
    pandoc.RawBlock('html', css)
  },
  linestretch = 1.2,
}
local doc = pandoc.Pandoc({}, meta)

for i, path in pairs(ls(tips_dir)) do
  doc.blocks:extend(readtip(join{tips_dir, path}))
end

local opts = pandoc.WriterOptions{
  template = pandoc.template.compile(pandoc.template.default 'html5')
}

print(pandoc.write(doc, 'html5', opts))
