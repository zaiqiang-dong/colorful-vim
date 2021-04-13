
function! colorful#setVarColor()
py3 << EOF
import re
import vim


keywords = set()
keyMacros = set()
keyObjects = set()

regexes = [re.compile(p) for p in ["(.*)struct( +)([a-zA-Z0-9_]+)( +\**)([a-zA-Z0-9_\*]+)([ ,;\)\[]+)(.*)",
				   "(.*)enum( +)([a-zA-Z0-9_]+)( +\**)([a-zA-Z0-9_\*]+)([ ,;\)\[]+)(.*)",
				   "(.*)union( +)([a-zA-Z0-9_]+)( +\**)([a-zA-Z0-9_\*]+)([ ,;\)\[]+)(.*)"]]

for line in vim.current.buffer:
    line = line.strip()
    if line.startswith("\*") or line.startswith("//") or line.startswith("#") or line.startswith("*"):
        continue
    for rg in regexes:
        matchObj = re.match(rg, line)
        if matchObj:
            keywords.add(matchObj.group(5))
            break
    matchObj = re.findall( r'[A-Z][A-Z_0-9]*', line)
    if matchObj:
        for s in matchObj:
            keyMacros.add(s)
    matchObj = re.findall( r'[a-zA-Z0-9_]+->', line)
    if matchObj:
        for s in matchObj:
            keyObjects.add(s[0:-2])
    matchObj = re.findall( r'[a-zA-Z0-9_]+\.', line)
    if matchObj:
        for s in matchObj:
            keyObjects.add(s[0:-1])

for s in keywords:
    vim.command("syn keyword structVar " + s)
for s in keyMacros:
    vim.command("syn keyword macroDef " + s)
for s in keyObjects:
    vim.command("syn keyword classObject " + s)
EOF
endfunction



