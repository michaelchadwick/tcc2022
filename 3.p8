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

function _init()
  cls(1)
  last = time()
  rainbow()
end

function print_msg()
  rectfill(1,1,126,15,5)
  print("hello tcc day 3!",34,3,0)
  print("hello tcc day 3!",33,2,7)
  print("press z/x to exit",31,10,0)
  print("press z/x to exit",31,9,7)
end

function rainbow()
  clr_index = p_offset
  for i=0,128 do
    for j=0,128 do
      if clr_index > count(clrs)-1 then
        clr_index = 0
      end
      pset(j,i,clrs[clr_index])
      clr_index += 1
    end
  end
end

function _draw()
	p_offset += 1
	if p_offset > count(clrs) then
	  p_offset = 0
	end
	rainbow()
	print_msg()
end

function _update()
  if (btnp(4) or btnp(5)) then
    cls()
    stop("have a nice day!")
  end
end
