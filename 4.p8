pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- tiny code christmas
-- day 4: sines of the times

max_y=127
max_x=127
mod=256
mod_max=mod*2
cy=0
cx=0
cc=6

function _init()
 cls()
 --printh('')
 --printh('cx:'..cx..',cy:'..cy)
 last=time()
end

function print_msg()
 rectfill(19,1,108,15,5)

 print("hello tcc day 4!",33,3,0)
 print("hello tcc day 4!",32,2,7)

 print("press z/x to exit",28,10,0)
 print("press z/x to exit",27,9,7)
end

function draw_color()
 for y=cy,(max_y+cy) do
  for x=cx,(max_x+cx) do
   if y>127 then y=y%128 end
   if x>127 then x=x%128 end

   --get sin val
   c=sin(y/mod) + sin(x/mod)
   --fill in pixel with color
   clr=((flr(c*8)+cc)%7)+8
   printh(clr)
   pset(y,x,clr)
  end
 end
end

function check_btns()
--left
 if btnp(0) then
  cy=abs(cy-1)%128
 end
	--right
 if btnp(1) then
  cy=abs(cy+1)%128
 end
 --up
 if btnp(2) then
  cx=abs(cx-1)%128
 end
 --down
 if btnp(3) then
  cx=abs(cx+1)%128
 end
 --z/x
 if btnp(4) or btnp(5) then
  cls(1)
  stop("have a nice day!")
 end
end

function _draw()
 draw_color()
 --print_msg()
end

function _update60()
 check_btns()
 --cycle through color palette
 cc=cc-1
 if mod>mod_max then mod=-mod end
 mod=mod+16
end
