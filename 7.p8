pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--tiny code christmas
--day 7: mix and match
--neb:https://neb.host/games/tcc/2022

clr_index=1
x=20
y=60
bg=0
fg=8
max_y=127
max_x=127
str_clrs={8,9,10,11,12,13,14}
str_clr=str_clrs[clr_index]
clrs={8,9,10,11,12,13,14,15}
p_offset=0
dir=128

--sin() modifier:
--cycles through sine wave
smods={}
smods_R={}
smods_idx=1
smods_r_idx=1

--height modifier:
--changes height of sine wave
hmods={}
hmods_idx=11

--time modifier:
--changes speed of text scroll
tmod=30

function print_table(tbl)
  str=''

  for v in all(tbl) do
    str=str..v..','
  end

  printh(str)
end

--https://www.lexaloffle.com/bbs/?pid=114184#p
function scale_text(str,x,y,c,scale)
  memcpy(0x4300,0x0,0x0200)
  memset(0x0,0,0x0200)
  poke(0x5f55,0x00)
  print(str,0,0,7)
  poke(0x5f55,0x60)

  local w,h = #str*4,5
  pal(7,c)
  palt(0,true)
  sspr(0,0,w,h,x,y,w*scale,h*scale)
  pal()

  memcpy(0x0,0x4300,0x0200)
end

function draw_rainbow()
  p_offset+=1
  if p_offset > count(clrs) then
    p_offset=0
  end
  clr_index=p_offset
  for i=0,dir do
    for j=0,dir do
      if clr_index > count(clrs)-1 then
        clr_index=0
      end
      pset(j,i,clrs[clr_index])
      clr_index+=1
    end
  end
end

function draw_scroller()
  str='mix and match'

  cls(bg)

  for ci=1,#str do
    letter=str[ci]

    xmod=7*ci+time()*tmod
    ymod=sin(ci/smod)*hmod

    x=20+xmod
    --make text wraparound
    x=x%128
    y=60+ymod

    --make text bigger!
    scale_text(letter,x+1,y+1,5,2)
    scale_text(letter,x,y,str_clr,2)
    --print(letter,x+1,y+1,5)
    --print(letter,x,y,str_clr)

  end
end

function check_btns()
  --left
  if btnp(0) then
    cls(bg)
    smod=smod-0.1
  end
  --right
  if btnp(1) then
    cls(bg)
    smod=smod+0.1
  end
  --up
  if btnp(2) then
    cls(bg)
    hmod=hmod+1
  end
  --down
  if btnp(3) then
    cls(bg)
    hmod=hmod-1
  end
  --z:reset
  if btnp(4) then
    smods_idx=1
    hmods_idx=11
    smod=smods[smods_idx]
    hmod=hmods[hmods_idx]
  end
  --x:exit program
  if btnp(5) then
    cls(1)
    stop("have a nice day!")
  end
end

function reset()
  cls(bg)
end

------------------
-- pico8 _funcs --
------------------
function _init()
  cls(bg)
  --printh('')

  --fill smods sequence
  for f=9.0,9.5,0.1 do
    add(smods,f)
  end

  temp=9.4
  --fill smods seq in reverse
  while temp > 8.9 do
    add(smods,temp)
    temp=temp-0.1
  end

  print_table(smods)

  smod=smods[smods_idx]

  --fill hmods sequence
  c1=-10
  c2=11
  while c1 < c2 do
    add(hmods,c1)
    c1=c1+1
  end
  c3=9
  c4=-10
  while c3 > c4 do
    add(hmods,c3)
    c3=c3-1
  end

  print_table(hmods)

  hmod=hmods[hmods_idx]
end

function _draw()
  draw_rainbow()
  --draw_scroller()

  print("7",124,122,7)
end

function _update()
  --check for btn presses
  check_btns()

  if time()%1%0.25==0 then
    clr_index=clr_index+1
    if clr_index>7 then clr_index=1 end
    str_clr=str_clrs[clr_index]
  end

  smods_idx=smods_idx+1
  if smods_idx==#smods then
    smods_idx=1
  end
  smod=smods[smods_idx]

  hmods_idx=hmods_idx+1
  if hmods_idx==#hmods then
    hmods_idx=1
  end
  hmod=hmods[hmods_idx]
end
