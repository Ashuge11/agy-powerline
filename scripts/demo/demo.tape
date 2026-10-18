# agy-powerline demo, recorded with VHS (https://github.com/charmbracelet/vhs)
# Run from the repo root, in a normal (non-Administrator) terminal:
#   vhs scripts/demo/demo.tape
# It writes assets/demo.gif.
#
# One take of configure, the editor with its live preview: add Gemini 4
# Argon's weekly quota from the Add list by typing "argon", pick the Dark
# Metro theme, then switch from Pills to the Lines layout.
#
# It starts from demo-config.json in a fresh temporary AGY_POWERLINE_HOME, so
# it never touches your real ~/.agy-powerline or agy settings. That config
# has 17 widgets, space between rows and an empty last row for Argon.

Output assets/demo.gif

# Large font on a wide canvas: text stays readable when the README scales
# the GIF down, and about 150 columns keep configure's details panel next to
# the list (it shows from 140 columns). About 4 MB, no shrinking needed.
Set Shell "pwsh"
Set FontFamily "JetBrains Mono"
Set FontSize 22
Set LineHeight 1.2
Set Width 2100
Set Height 1040
Set Padding 24
Set Margin 0
Set BorderRadius 10
Set WindowBar "Colorful"
Set WindowBarSize 36
Set Theme "Catppuccin Mocha"
Set TypingSpeed 45ms
Set PlaybackSpeed 1.0
# At 30 fps VHS drops frames on Windows and the GIF plays too fast.
Set Framerate 15

# Off camera:
# - A short prompt, no npm progress spinner and no PSReadLine suggestions.
# - npx runs agy-powerline@latest even when an older version is installed
#   globally (npx would pick that one up instead).
# - One warm-up run, so configure opens quickly on camera.
Hide
Type `$env:npm_config_progress='false'; Set-PSReadLineOption -PredictionSource None; $env:AGY_POWERLINE_HOME = Join-Path ([IO.Path]::GetTempPath()) ('agy-powerline-demo-' + [Guid]::NewGuid()); New-Item -ItemType Directory $env:AGY_POWERLINE_HOME | Out-Null; Copy-Item scripts/demo/demo-config.json (Join-Path $env:AGY_POWERLINE_HOME 'statusline.config.json'); function npx { npx.cmd --yes ($args -replace '^agy-powerline$', 'agy-powerline@latest') }; npx agy-powerline --version; function prompt { [Environment]::NewLine + '> ' }; Clear-Host`
Enter
Wait@90s
Show
Sleep 800ms

Type "npx agy-powerline configure"
Sleep 500ms
Enter
Wait+Screen@60s /Live preview/
Sleep 2.5s

# Add (a), filtered by typing. configure 1.3.0 inserts an added widget near
# the top of the list, not after the selected one, so "]" moves it down to
# the end (it stops at the last place): on the empty last row.
Type "a"
Sleep 800ms
Type@150ms "argon"
Sleep 1.5s
Enter
Sleep 800ms
Type@40ms "]]]]]]]]]]]]]]]]]]]]]]]]"
Sleep 2s

# Themes (t): opens on Dark Aurora; the preview recolors as the cursor
# moves down to Dark Metro, then apply.
Type "t"
Sleep 1s
Down@450ms 8
Sleep 1s
Enter
Sleep 2.5s

# Layout (l): Pills is current; Lines shows the same widgets as plain
# colored text with dot meters. Preview it, then apply and hold.
Type "l"
Sleep 1.2s
Down 1
Sleep 2.5s
Enter
Sleep 4s
