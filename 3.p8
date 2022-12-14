pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- tiny code christmas
-- day 3: little by little

-- 0 black
-- 1 dark-blue
-- 2 dark-purple
-- 3 dark-green
-- 4 brown
-- 5 dark-gray
-- 6 light-gray
-- 7 white
-- 8 red
-- 9 orange
-- 10 yellow
-- 11 green
-- 12 blue
-- 13 lavender
-- 14 pink
-- 15 light-peach

clrs = {8,9,10,11,12,13,14,15}
p_offset = 0
effect = 0
dir = 128

function _init()
  cls(1)
  last = time()
end

function print_msg()
  rectfill(19,1,108,22,5)
  
  print("hello tcc day 3!",33,3,0)
  print("hello tcc day 3!",32,2,7)
  
  print("z: chg fx, x: exit",28,10,0)
  print("z: chg fx, x: exit",27,9,7)

  print("< / >: chg rainbow dir",21,17,0)
  print("< / >: chg rainbow dir",20,16,7)
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

function _draw()
	 draw_effect()
	 print_msg()
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
