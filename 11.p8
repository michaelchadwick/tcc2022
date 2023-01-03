pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
--tiny code christmas
--day 11: The Third Dimension
--neb:https://neb.host/games/tcc/2022

angle=0

function rotatey(p,angle)
  xt=p.x*cos(angle) - p.z*sin(angle)
  yt=p.y
  zt=p.x*sin(angle) + p.z*cos(angle)

  return {x=xt,y=yt,z=zt}
end

function rotatex(p,angle)
  xt=p.x
  yt=p.y*cos(angle) - p.z*sin(angle)
  zt=p.y*sin(angle) + p.z*cos(angle)

  return {x=xt,y=yt,z=zt}
end

function rotatez(p,angle)
  xt=p.x*cos(angle) - p.y*sin(angle)
  yt=p.x*sin(angle) + p.y*cos(angle)
  zt=p.z

  return {x=xt,y=yt,z=zt}
end

function zsort(points)
  for i=1,#points do
    local j=i

    while j > 1 and points[j-1].z<points[j].z do
      points[j-1],points[j] = points[j],points[j-1]
      j=j-1
    end
  end
end

function _draw()
  cls()
  t=time()
  points={}
  angle=angle+.01

  for x=-12,12,6 do
    for y=-12,12,6 do
      for z=-12,12,6 do
        p=rotatez({x=x,y=y,z=z},angle)
        q=rotatex(p,angle)
        r=rotatey(q,angle)

        add(
         	points,
          {
         	 	x=r.x,
         	 	y=r.y,
         	 	z=r.z+400
          }
        )
      end
    end
  end

  zsort(points)

  for i=1,#points do
    for j=0,2 do
      circfill(
        64+600*points[i].x/points[i].z-j/2,
        64+600*points[i].y/points[i].z-j/2,
        3-j,
        13-j
      );
    end
  end
end
