pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--tiny code christmas
--day 3: little by little
--neb:https://neb.host/games/tcc/2022

clrs = {8,9,10,11,12,13,14,15}
p_offset = 0
effect = 0
dir = 128

function print_header(y,num,strs)
  str="tcc day "..num.."!"
  strs=strs or {}

  rectfill(8,0,117,7+(#strs*7),5)

  print(str,hctr(str),y-0,0)
  print(str,hctr(str),y-1,7)

  for ci=1,#strs do
    print(strs[ci],hctr(strs[ci]),y+(ci*7),0)
    print(strs[ci],hctr(strs[ci]),y+((ci*7)-1),7)
  end
end

--https://pico-8.fandom.com/wiki/Centering_Text
function hctr(s)
  return 64-#s*2
end

function vctr(s)
  return 61
end

function draw_rainbow()
  p_offset += 1
  if p_offset > count(clrs) then
    p_offset = 0
  end
  clr_index = p_offset
  for i=0,dir do
    for j=0,dir do
      if clr_index > count(clrs)-1 then
        clr_index = 0
      end
      pset(j,i,clrs[clr_index])
      clr_index += 1
    end
  end
end

function draw_rand_pixels()
  pset(rnd(128),rnd(128),rnd(16))
end

function draw_effect()
  if effect == 0 then
    draw_rand_pixels()
  elseif effect == 1 then
    draw_rainbow()
  end
end

function change_dir()
  dir -= 1
  if dir < 126 then
    dir = 128
  end
end

function switch_effect()
  cls(1)
  if effect == 0 then
    effect = 1
  else
    effect = 0
  end
end

------------------
-- pico8 _funcs --
------------------
function _init()
  cls(1)
  last = time()
end

function _draw()
  draw_effect()
  print_header(2,3,
    {
      "z: chg fx, x: exit",
      "< / >: chg rainbow dir"
    }
  )
end

function _update60()
  if btnp(0) or btn(1) then
    change_dir()
  end

  if btnp(4) then
    switch_effect()
  end
  if btnp(5) then
    cls()
    stop("have a nice day!")
  end
end
