pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- tiny code christmas
-- day 5: polar express

max_y=127
max_x=127
mod=256
mod_max=mod*2
cy=0
cx=0
px=0
--frameskip
fmod=1
--speed
pmod=1
--smod:amount of screen
--     space taken by anim
--1:fullscreen,2:1/2,4:1/4
smod=2

--palettes
pal1={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
pal2={8,9,10,11,12,13,14}
pal3={0,5,6,7,15,14,8,2,4,9,10,11,3,12,13,1}
pal4={0,7}

pals_i=1
clrs_i=1

function _init()
 cls()
 printh('')
end

function print_hello(x,y,num)
 rectfill(8,0,117,21,5)

 print("tcc day "..num.."!",x-0,y-0,0)
 print("tcc day "..num.."!",x-1,y-1,7)

 print("z:reset/cycle size,x:exit",x-32,y+7,0)
 print("z:reset/cycle size,x:exit",x-31,y+6,7)

 print("\139:f/2 \145:f*2 \148:p+5 \131:p-5",x-36,y+14,0)
 print("\139:f/2 \145:f*2 \148:p+5 \131:p-5",x-35,y+13,7)
end

function draw_polar()
 y1=cy-(64/smod)+2
 y2=((max_y/(2*smod))-1)
 x1=cx-(64/smod)+2
 x2=((max_x/(2*smod))-1)
 for y=y1,y2,fmod do
  for x=x1,x2,fmod do
   --get angle (0->1)
   --a=atan2(y,x)*16
   --get distance
   d=sqrt(x*x+y*y)

   --printh('a:'..a..',d:'..d)

   --create perspective
   p=1
   ---add seychelles
   --clr=(p+px)/(a)
   ---add tunnel
   clr=(p+px)/(d)
   ---add spiral
   --clr=(p+px)/(a+d)
   ---add static
   --clr=(p+200)/d

   --todo:only use colors in
   --     specific palette
   --clr=pal_restrict(clr,pal4)

   pset(x+64,y+64,clr)
  end
 end
end

function pal_restrict(c,p)
 if c<1 then
  c=1
 elseif c>#p then
  c=#p
 end

 return p[c]
end

function check_btns()
 --left:lower frameskip
 if btnp(0) then
  fmod=fmod/2
  if fmod<1 then fmod=1 end
  reset()
 end
	--right:raise frameskip
 if btnp(1) then
  fmod=fmod*2
  reset()
 end
 --up:go faster
 if btnp(2) then
  i=5
  while pmod<499 and i>0 do
   pmod=pmod+1
   i=i-1
  end
 end
 --down:go slower
 if btnp(3) then
  i=5
  while pmod>0 and i>0 do
   pmod=pmod-1
   i=i-1
  end
 end
 --z:reset/cycle size
 if btnp(4) then
  smod=smod/2
  if smod<1 then smod=4 end
  reset()
 end
 --x:exit program
 if btnp(5) then
  cls(1)
  stop("have a nice day!")
 end
end

function reset()
 cls()
 cx=0
 cy=0
 px=0
end

function _draw()
 --t=time()%1
 --if t%0.25==0 then
 if true then
  draw_polar()
  --display fps
  --print(stat(7),0,0,7)
 end

 print_hello(45,2,5)
 --printh('fmod:'..fmod..',pmod:'..pmod)
end

function _update()
 --check for btn presses
 check_btns()
 --increase perspective
 px=px+pmod
end
