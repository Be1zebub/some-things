local input = "1c,abnf,accesslog,actionscript/as,ada,angelscript/asc,apache/apacheconf,applescript/osascript,arcade,c-like/c/cc/h/c++/h++/hpp/hh/hxx/cxx,cpp,arduino,armasm/arm,xml/html/xhtml/rss/atom/xjb/xsd/xsl/plist/wsf/svg,asciidoc/adoc,aspectj,autohotkey/ahk,autoit,avrasm,awk,axapta,bash/sh/zsh,basic,bnf,brainfuck/bf,c,cal,capnproto/capnp,ceylon,clean/icl/dcl,clojure/clj,clojure-repl,cmake/cmake.in,coffeescript/coffee/cson/iced,coq,cos/cls,crmsh/crm/pcmk,crystal/cr,csharp/cs/c#,csp,css,d,markdown/md/mkdown/mkd,dart,delphi/dpr/dfm/pas/pascal/freepascal/lazarus/lpr/lfm,diff/patch,django/jinja,dns/bind/zone,dockerfile/docker,dos/bat/cmd,dsconfig,dts,dust/dst,ebnf,elixir,elm,ruby/rb/gemspec/podspec/thor/irb,erb,erlang-repl,erlang/erl,excel/xlsx/xls,fix,flix,fortran/f90/f95,fsharp/fs,gams/gms,gauss/gss,gcode/nc,gherkin/feature,glsl,gml,go/golang,golo,gradle,groovy,haml,handlebars/hbs/html.hbs/html.handlebars/htmlbars,haskell/hs,haxe/hx,hsp,htmlbars/hbs/html.hbs/html.handlebars,http/https,hy/hylang,inform7/i7,ini/toml,irpf90,isbl,java/jsp,javascript/js/jsx/mjs/cjs,jboss-cli/wildfly-cli,json,julia,julia-repl/jldoctest,kotlin/kt,lasso/ls/lassoscript,latex/tex,ldif,leaf,less,lisp,livecodeserver,livescript/ls,llvm,lsl,lua,makefile/mk/mak,mathematica/mma/wl,matlab,maxima,mel,mercury/m/moo,mipsasm/mips,mizar,perl/pl/pm,mojolicious,monkey,moonscript/moon,n1ql,nginx/nginxconf,nim,nix/nixos,nsis,objectivec/mm/objc/obj-c,ocaml/ml,openscad/scad,oxygene,parser3,pf/pf.conf,pgsql/postgres/postgresql,php/php3/php4/php5/php6/php7,php-template,plaintext/text/txt,pony,powershell/ps/ps1,processing,profile,prolog,properties,protobuf,puppet/pp,purebasic/pb/pbi,python/py/gyp/ipython,python-repl/pycon,q/k/kdb,qml/qt,r,reasonml/re,rib,roboconf/graph/instances,routeros/mikrotik,rsl,ruleslanguage,rust/rs,sas,scala,scheme,scilab/sci,scss,shell/console,smali,smalltalk/st,sml/ml,sqf,sql,stan/stanfuncs,stata/do/ado,step21/p21/step/stp,stylus/styl,subunit,swift,taggerscript,yaml/yml,tap,tcl/tk,thrift,tp,twig/craftcms,typescript/ts,vala,vbnet/vb,vbscript/vbs,vbscript-html,verilog/v/sv/svh,vhdl,vim,x86asm,xl/tao,xquery/xpath/xq,zephir/zep"

function string.split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)

   while s do
      	if s ~= 1 or cap ~= "" then
     		table.insert(Table, cap)
      	end

      	last_end = e + 1
      	s, e, cap = pString:find(fpat, last_end)
   end

   if last_end <= #pString then
      	cap = pString:sub(last_end)
      	table.insert(Table, cap)
   end
   return Table
end

local out = {}

for i, lang in ipairs(input:split(",")) do
    if lang:find("/", 1, true) then
        for i2, lang2 in ipairs(lang:split("/")) do
                table.insert(out, lang2)
        end
    else
        table.insert(out, lang)
    end
end

table.sort(out, function(a, b)
    return a < b
end)
    
for k, v in ipairs(out) do
   out[k] = "\"".. v .."\"" 
end

print("{".. table.concat(out, ", ") .."}")
