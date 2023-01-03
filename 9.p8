pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--tiny code christmas
--day 9: Shade the bob
--neb:https://neb.host/games/tcc/2022

function _init()
  cls(1)
  --checkerboard fill pattern
  --fillp(0b0011001111001100)
  --light/dark blue
 	--fillp(0b0011001111001100.1)
  ?"⁶!5f100█2☉9:⌂⬅️⬇️1▒😐<765"
end

function _draw()
  xmod1=cos(t()/3.4)
  xmod2=60

  ymod1=sin(t()/2.2)
  ymod2=60

  x=64 + xmod1 * xmod2
  y=64 + ymod1 * ymod2

  for i=-2,2 do
    for j=-2,2 do
      pset(x+j,y+i,7)
    end
  end

  print('9',125,123,7)
end

--function _update()
--end
