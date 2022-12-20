pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--tiny code christmas
--day 2: snow time() like the present
--neb:https://neb.host/games/tcc/2022

function draw_grnd()
  rectfill(0,110,160,160,3)
end

function draw_tree()
  -- trunk
  rectfill(60,98,67,119,4)

  -- tree layers
  spr(1,28,90)
  spr(9,36,90)
  spr(9,44,90)
  spr(9,52,90)
  spr(9,60,90)
  spr(9,68,90)
  spr(9,76,90)
  spr(9,84,90)
  spr(1,92,90,1,1,true)

  spr(1,36,82)
  spr(9,44,82)
  spr(9,52,82)
  spr(9,60,82)
  spr(9,68,82)
  spr(9,76,82)
  spr(1,84,82,1,1,true)

  spr(1,44,74)
  spr(9,52,74)
  spr(9,60,74)
  spr(9,68,74)
  spr(1,76,74,1,1,true)

  spr(1,36,66)
  spr(9,44,66)
  spr(9,52,66)
  spr(9,60,66)
  spr(9,68,66)
  spr(9,76,66)
  spr(1,84,66,1,1,true)

  spr(1,44,58)
  spr(9,52,58)
  spr(9,60,58)
  spr(9,68,58)
  spr(1,76,58,1,1,true)

  spr(1,52,50)
  spr(9,60,50)
  spr(1,68,50,1,1,true)

  spr(1,44,42)
  spr(9,52,42)
  spr(9,60,42)
  spr(9,68,42)
  spr(1,76,42,1,1,true)

  spr(1,52,34)
  spr(9,60,34)
  spr(1,68,34,1,1,true)

  spr(10,60,26)
end

function draw_snow()
  for i=1,40 do
    randx=rnd(160)
    randy=rnd(160)
    randz=flr(rnd(1000))
    clr=pget(randx,randy)
    if clr != 3 then
      if clr != 4 then
        if clr != 7 then
          if clr != 11 then
            if clr != 12 then
              if randz % 1 == 0 then
                pset(randx,randy,7)
              end
            end
          end
        end
      end
    end
  end
end

function remove_snow()
  for i=0,160 do
    for j=0,160 do
      if pget(i,j) == 7 then
        pset(i,j,0)
      end
    end
  end
end

------------------
-- pico8 _funcs --
------------------
function _init()
  cls()
  print("hello tcc day 2!",32,0,12)
  print("press z/x to exit",30,6,12)
end

function _draw()
  remove_snow()
  draw_grnd()
  draw_tree()
  draw_snow()
end

function _update()
  if (btnp(4) or btnp(5)) then
    cls()
    stop("have a nice day!")
  end
end
__gfx__
00000000000000030000000000000000000000000000000000000000000000000000000033333333000000000000000000000000000000000000000000000000
00000000000000330000000300000000000000000000000000000000000000000000000033333333000aa0000000000000000000000000000000000000000000
00700700000003330000003300000003000000000000000000000000000000000000000a3333333300aaaa000000000000000000000000000000000000000000
00077000000033330000033300000033000000030000000000000000000000000000000733333333000aa0000000000000000000000000000000000000000000
0007700000033333000033330000033300000033000000030000000000000000000000773333333300a33a000000000000000000000000000000000000000000
00700700003333330003333300003333000003330000003300000003000000000000077733333333003333000000000000000000000000000000000000000000
00000000033333330033333300033333000033330000033300000033000000030000007733333333033333300000000000000000000000000000000000000000
00000000bbbbbbbb03333333003333330003333300003333000003330000003300000773bbbbbbbb333333330000000000000000000000000000000000000000
