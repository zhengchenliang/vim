Forked from David Chen

Run:
  cp vimrc ~/.vimrc
  vim

Settings:
  Q = :q - quit                  q - recording
  W = :w - write                 w - recording
  E - to word end                e - to word end
  R - enter replace mode         r - replace single char
  T -                            t -
  Y - (replaced)                 y - redo
  U - undo line                  u - undo

  I - cursor up 5                i - cursor up
  J - cursor left 5              j - cursor left
  K - cursor down 5              k - cursor down
  L - cursor right 5             l - cursor right
  Space+i - up 5 cursor stay
  Space+k - down 5 cursor stay

  O - cursor left 5 words        o - cursor left 1 word
  P - cursor right 5 words       p - cursor right 1 word

  a - enter insert mode append   A - enter insert mode append at eof
  s - enter insert mode insert   S - enter insert mode insert at bol
  d - delete to vim register     D - go to line beginning
  f - copy to vim register       F - copy to system clipboard (pacman -S xclip)
  h - paste after                H - paste before
  g -                            G -

  Z - quit                       z - extra cmds
  X - enter insert mode w/ backs x - enter insert mode w/ delete char
  C - enter insert mode to eol   c - enter insert mode change
  V - enter visual line mode     v - enter visual mode
  B - to previous word           b - to previous word
  N - to previous word find      n - to next word find
  M -                            m -

  gi - split this window to up
  gj - split this window to left
  gk - split this window to down
  gl - split this window to right
  gu - switch up and down windows
  gh - switch left and right windows
  gfu - rotate up up up windows
  gfh - rotate left left left windows
  Space+n - move cursor to next window
  Space+i - move cursor to up window
  Space+j - move cursor to left window
  Space+k - move cursor to down window
  Space+l - move cursor to right window
  
  tn - enter tab mode make new tabe
  ti - move cursor to up tabe
  tj - move cursor to left tabe
  tk - move cursor to down tabe
  tl - move cursor to right tabe
  
  bd - build program -> 283-291: implemented
  rn - run program -> 254-281: implemented
