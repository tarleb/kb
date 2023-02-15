-- Parameters
local tips_dir = arg[1] or 'tips'
local site_dir = arg[2] or '_site'

local join, split_extension, filename = pandoc.path.join,
  pandoc.path.split_extension, pandoc.path.filename
local ls = pandoc.system.list_directory
local stringify = pandoc.utils.stringify

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
  background-color: #e0e4e8;
  border: transparent solid 1px;
  border-radius: 0.75ex;
  display: inline-block;
  padding: 0.33ex 1ex;
  margin-right: 1ex;
}
.tag.selected {
  background-color: #d3edda;
  color: #16591a;
  border: #16591a solid 1px;
}
</style>
]]

local script = [[
<script src="tips.js" async="" type="text/javascript">
</script>
]]

local function tag_span (tip)
  return pandoc.Span(tip, {class='tag'})
end

local function readfile (path)
  local fh <close> = io.open(path, 'r')
  return fh:read 'a'
end

local function readtip (filepath)
  local doc = pandoc.read(readfile(filepath))
  local tip_id = 'tip-' .. split_extension(filename(filepath))
  local tags = pandoc.utils.type(doc.meta.tags) == 'List'
    and doc.meta.tags:map(stringify)
    or pandoc.List{}
  doc.blocks:insert(
    1,
    pandoc.Div(
      pandoc.Plain(tags:map(tag_span)),
      {class='tags'}
    )
  )
  if doc.meta.title then
    doc.blocks:insert(
      1,
      pandoc.Header(2, doc.meta.title)
    )
  end
  local tip_attr = {
    id = tip_id,
    class = 'tip',
    tags = table.concat(tags, ',')
  }
  return pandoc.Blocks(
    pandoc.Div(doc.blocks, tip_attr)
  )
end

local meta = {
  title = pandoc.Inlines('Pandoc Tips'),
  author = pandoc.Inlines('Albert Krewinkel, Ilona Silverwood'),
  ['header-includes'] = {
    pandoc.RawBlock('html', css),
    pandoc.RawBlock('html', script),
  },
  linestretch = 1.2,
}
local doc = pandoc.Pandoc({}, meta)

for i, path in pairs(ls(tips_dir)) do
  if select(2, split_extension(path)) == '.md' then
    doc.blocks:extend(readtip(join{tips_dir, path}))
  end
end

-- fill and write mediabag
doc = pandoc.mediabag.fill(doc)
pandoc.mediabag.insert('tips.js', 'text/javascript', readfile('tips.js'))
pandoc.mediabag.write(site_dir)

local opts = pandoc.WriterOptions{
  template = pandoc.template.compile(pandoc.template.default 'html5')
}

local outfh = io.open(join{site_dir, 'index.html'}, 'w')
outfh:write(pandoc.write(doc, 'html5', opts))
outfh:close()
