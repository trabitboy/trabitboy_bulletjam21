require('title')
initTitle()

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

--wave definition with 10s countdown
wavecountdown=3
lasttime=0



--shoot on side ???? when space pressed

--glow that is a variable for ennemy touched
--explosions ? chained circle with alpha
--dodging is not satisfying ,
--ennemy bullets should be round,
-- solution : display hitbox at center of
-- bullet 
--or collisions exact

--clean up bullets going out of screen
-- 2 levels of speed ( one holding, one releasing     )
--title 
--every 10s reinforcement ? strange ? scroll to new screen every 10s ?
--new bg every 10 S ? 2 bgs one that scrolls , one in between 10s
--super weapon every 10 s ? 

--screen import from zaz2nim for ennemies ?
defaultradius=20
bulletradius=5

dftplycooldown=10

--let's make them slightly bigger TODO
plybltrad=20

ply={
  --ref
    tapspd=10,
    holdspd=5,
    maskradius=5,
    bltradius=25,
    --data
    cooldown=0,
    x=600,
    y=900,
    --switched when holding / releasing button
    spd=10,
    dead=false,
    resetcounter=0 -- once dead, before going to title
  }



ccoll=function(x1,y1,r1,x2,y2,r2)
  --pythagore
  -- sq(x2-x1) + sq(y2 - y1) = sq(r1+r2)
  --if sq (r1 + r2 )>  coll
  if (r1+r2)*(r1+r2)>( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)  )  then
    return true
    
  end  
  
  return false
end




--with this I can test ennemy types immediately ( no map data )
wav1=function()
  

  createStaticEnnemy(
    {
    type='static',
    x=100,
    y=100,
    hp=10,
    data={
      -- for static 
        rate=20,
        fspeed=5,
  --      dir=radiant,
--        multiple=3
        
      }
    }
  )
  
  createStaticEnnemy(
    {
    type='static',
    x=900,
    y=100,
    hp=10,
    data={
      -- for static 
        rate=30,
        fspeed=5,
  --      dir=radiant,
--        multiple=3
        
      }
    }
  )

  createStaticEnnemy(
    {
    type='static',
    x=1080/2,
    y=400,
    hp=10,
    data={
      -- for static 
        rate=20,
        fspeed=5,
  --      dir=radiant,
--        multiple =3
        
      }
    }
  )
  
end

wav2=function()
  

--ennemy factory
--{
--  type='static',
--  x=,
--  y,
--  data={
--    -- for static 
--      rate=num,
--      fspeed=num,
--      dir=radiant,
--      multiple=
--    }
  
--  }  
  createStaticEnnemy(
    {
    type='static',
    x=200,
    y=100,
    hp=10,
    data={
      -- for static 
        rate=20,
        fspeed=10,
  --      dir=radiant,
        multiple=3
        
      }
    }
  )
  
  createStaticEnnemy(
    {
    type='static',
    x=800,
    y=100,
    hp=10,
    data={
      -- for static 
        rate=30,
        fspeed=5,
  --      dir=radiant,
        multiple=3
        
      }
    }
  )

  createStaticEnnemy(
    {
    type='static',
    x=1080/2,
    y=300,
    hp=10,
    data={
      -- for static 
        rate=20,
        fspeed=10,
  --      dir=radiant,
        multiple=3
        
      }
    }
  )
  
end


--{
--  type='rotating',
--  x=, rendered center
--  y, rendered center
--  data={
--      rotspeed=radiant
--      rate=num,
--      fspeed=num,
--      dir=radiant,
--        xc, xcenter
--        yc, ycenter
    --  radius
--    }
  
--  }
wav3=function()
  
wav3health=10

  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav3health,
  data={
      rotspeed=math.pi/100,
      rate=10,
      fspeed=3,
      dir=0,
      xc=500, 
      yc=500, 
      radius=100
    }
  
  }
  )
  
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav3health,
  data={
      rotspeed=math.pi/100,
      rate=10,
      fspeed=3,
      dir=math.pi/4,
      xc=500, 
      yc=500, 
      radius=100
    }
  
  }
  )
  
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav3health,
  data={
      rotspeed=math.pi/100,
      rate=10,
      fspeed=3,
      dir=math.pi,
      xc=500, 
      yc=500, 
      radius=100
    }
  
  }
  )
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav3health,
  data={
      rotspeed=math.pi/100,
      rate=10,
      fspeed=3,
      dir=3*math.pi/4,
      xc=500, 
      yc=500, 
      radius=100
    }
  
  }
  )
  
  
end

wav4=function()
  
wav4health=10
wav4radius=50
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav4health,
  data={
      rotspeed=-math.pi/100,
      rate=10,
      fspeed=3,
      dir=0,
      xc=500, 
      yc=500, 
      radius=wav4radius
    }
  
  }
  )
  
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav4health,
  data={
      rotspeed=-math.pi/100,
      rate=10,
      fspeed=3,
      dir=math.pi/4,
      xc=500, 
      yc=500, 
      radius=wav4radius
    }
  
  }
  )
  
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav4health,
  data={
      rotspeed=-math.pi/100,
      rate=10,
      fspeed=3,
      dir=math.pi,
      xc=500, 
      yc=500, 
      radius=wav4radius
    }
  
  }
  )
  createRotatingEnnemy(
{
  type='rotating',
  x=-100, 
  y=-100, 
  hp=wav4health,
  data={
      rotspeed=-math.pi/100,
      rate=10,
      fspeed=3,
      dir=3*math.pi/4,
      xc=500, 
      yc=500, 
      radius=wav4radius
    }
  
  }
  )
  
  
end


initwaveslist=function()
  waves={
    wav1,
    wav2,
    wav3,
    wav4

    }
  
  nextwave=1
  
  
end

initwaveslist()


--levels are vertical, suite of screens with markers
lvly=0





bltbase=20

--ply bullets 
blts={}

--ennemy bullets
eblts={}

--gameobjects
gos={}


dfltgordr=function(o)
    love.graphics.circle('fill',o.x,o.y,defaultradius)
end


staticbhv=function(st)
  st.fcnt=st.fcnt+1
  if st.fcnt >st.data.rate then
    st.fcnt=1
    fire(st.x,st.y,st.data.fspeed,st.data.dir,bhvennemyfire,rdrenblt)
    
    if st.data.multiple==3 then
      fire(st.x,st.y,st.data.fspeed,st.data.dir-math.pi/4,bhvennemyfire,rdrenblt)
      
      fire(st.x,st.y,st.data.fspeed,st.data.dir+math.pi/4,bhvennemyfire,rdrenblt)
    end
    
  end
  
end


--ennemy factory
--{
--  type='static',
--  x=,
--  y,
--  data={
--    -- for static 
--      rate=num,
--      fspeed=num,
--      dir=radiant,
--      multiple=
--    }
  
--  }

createStaticEnnemy=function(ldata)
  --TODO hardcoded for static multiple
  len={}
  len.x=ldata.x
  len.y=ldata.y
  len.hp=ldata.hp
  
  len.data={
      rate=ldata.data.rate,
      fspeed=ldata.data.fspeed,
      dir=math.pi/2,
      multiple=ldata.data.multiple
    }
  len.bhv=staticbhv
  len.rdr=dfltgordr
  --transient
  len.fcnt=1
  
  
  table.insert(gos,len)
end

--{
--  type='rotating',
--  x=, rendered center
--  y, rendered center
--  data={
--      rotspeed=radiant
--      rate=num,
--      fspeed=num,
--      dir=radiant,
--        xc, xcenter
--        yc, ycenter
    --  radius
--    }
  
--  }

rotatingbhv=function(rt)
  rt.fcnt=rt.fcnt+1
  if rt.fcnt >rt.data.rate then
    rt.fcnt=1
    fire(rt.x,rt.y,rt.data.fspeed,rt.data.dir,bhvennemyfire,rdrenblt)
    
--    if rt.data.multiple==3 then
--      fire(rt.x,rt.y,rt.data.fspeed,rt.data.dir-math.pi/4,bhvennemyfire,rdrenblt)
      
--      fire(rt.x,rt.y,rt.data.fspeed,rt.data.dir+math.pi/4,bhvennemyfire,rdrenblt)
--    end
  end
  
  --move on cirle defined by x, y , radius
  rt.data.dir=rt.data.dir+rt.data.rotspeed
  rt.x= rt.data.radius*math.cos(rt.data.dir)   +rt.data.xc
  rt.y= rt.data.radius*math.sin(rt.data.dir)   +rt.data.yc
  
end


createRotatingEnnemy=function(ldata)
  
  len={}
  len.x=ldata.x
  len.y=ldata.y
  len.hp=ldata.hp
  
  len.data={
      rotspeed=ldata.data.rotspeed,
      rate=ldata.data.rate,
      fspeed=ldata.data.fspeed,
      dir=ldata.data.dir,
      multiple=ldata.data.multiple,
      radius=ldata.data.radius,
      xc=ldata.data.xc,
      yc=ldata.data.yc
      
    }
  len.bhv=rotatingbhv
  len.rdr=dfltgordr

  --transient
  len.fcnt=1
  
  
  table.insert(gos,len)
end


bltscreencheck=function(b,idx)
  if b.x>1080 or b.x<0 or b.y<0 or b.y>1080 then
    table.remove(blts,idx)
  
  end
end


-- explosion x y radius
explosionbhv=function(e,idx)
  e.radius = e.radius -1
  if e.radius <0 then
      table.remove(gos,idx)
    end
end

explosionrdr=function(e)
  love.graphics.setColor(0.,1.,1.)
  love.graphics.circle("fill",e.x,e.y,e.radius)
  
end

triggerexplosion= function( lx,ly )

      lexp={x=lx,y=ly,radius=100,collide=false}
      lexp.bhv=explosionbhv
      lexp.rdr=explosionrdr
      table.insert(gos,lexp)
end


--kills ply
bhvennemyfire=function(b,idx)
    --TODO replace by bhv
    if ply.dead==false then
      if ccoll(ply.x,ply.y,ply.maskradius,b.x,b.y,bulletradius) then
        print('game over')
        triggerexplosion(ply.x,ply.y)
        
        ply.dead=true
        ply.resetcounter=300
        
  --      love.event.quit("restart")

  --      initTitle()
      end
    end
      
--    b.y=b.y-15
    b.x=b.x+b.vx
    b.y=b.y+b.vy
    --TODO top check
    bltscreencheck(b,idx)
end

--damages ennemies
bhvplyfire=function(b,idx)
    
  for j,o in ipairs (gos)
  do
    if o.collide==false then
      --kb has no tilde
    else
      if ccoll(o.x,o.y,defaultradius,b.x,b.y,ply.bltradius) then
        o.hp=o.hp-1
        if o.hp<1 then 
          print ('go dead') 
          triggerexplosion(o.x,o.y)
          table.remove(gos,j)
        end
        
        table.remove(blts,idx)
      end
    end
  end  
  
    --TODO replace by bhv
--    if ccoll(ply.x,ply.y,defaultradius,b.x,b.y,bulletradius) then
--      print('game over')
--      love.event.quit()
--    end
    
--    b.y=b.y-15
    b.x=b.x+b.vx
    b.y=b.y+b.vy
    --TODO top check
    
    bltscreencheck(b,idx)
end

rdrenblt=function(b)
    love.graphics.setColor(1.0,0.,0.,0.5)
   love.graphics.polygon('fill',b.x-bltbase,b.y-bltbase/2,b.x+bltbase,b.y-bltbase/2,b.x,b.y+bltbase/2)
    love.graphics.setColor(1.0,0.,0.,1.)
    love.graphics.circle("fill",b.x,b.y,bulletradius)
end

rdrplyblt=function(b)
    lzoom=ply.bltradius/8
--   love.graphics.polygon('fill',b.x-bltbase,b.y,b.x+bltbase,b.y,b.x,b.y-bltbase)
    love.graphics.setColor(0.5,0.5,1.,0.2)
   love.graphics.polygon('fill',b.x-bltbase*lzoom,b.y+bltbase*lzoom/2,b.x+bltbase*lzoom,b.y+bltbase*lzoom/2,b.x,b.y-bltbase*lzoom/2)   
    love.graphics.setColor(0.0,0.,1.,7.)
    love.graphics.circle("fill",b.x,b.y,ply.bltradius)
end


fire=function(lx,ly,lspd,langle,lbhv,lrdr)
  
  --cos = cote adjacent (vx) sur hyp 
  tvx= math.cos(langle)*lspd
  --sinus = cote op ( vy ) sur hyp
  tvy= math.sin(langle)*lspd
  
  print(' vx '..tvx..' vy '..tvy)
  blt={x=lx,y=ly,vx=tvx,vy=tvy,bhv=lbhv,rdr=lrdr}
  
  table.insert(blts,blt)
end


love.window.setMode(1080,1080)

--dev debug
--wav1()
--wav2()


--vector style
renderbg=function()
  love.graphics.setColor(0.,.3,0.,1.)
  
  --based on lvl y we render 2 slots
  screenNum=math.floor(lvly/1080)
  
  ltop=lvly%1080
  love.graphics.line(0,ltop,1080,ltop)
end

drawGame=function()
  
  renderbg()
  
--  love.graphics.print("lvl y "..lvly)
  love.graphics.print("wave countdown "..wavecountdown,x,y,0,4,4)
  
  --ens
  love.graphics.setColor(1.0,.0,.0,1.0)
  for i,o in ipairs (gos)
  do
--    love.graphics.circle('fill',o.x,o.y,defaultradius)
    o.rdr(o)
  end
  
  if ply.dead==false then
  --ply
    love.graphics.setColor(1.0,1.0,1.0,1.0)
    love.graphics.circle('fill',ply.x,ply.y,defaultradius)
    love.graphics.setColor(0.0,0.0,1.0,1.0)
    love.graphics.circle('fill',ply.x,ply.y,ply.maskradius)
  end
  
  --blts
  for i,b in ipairs (blts)
  do
    b.rdr(b)
      --love.graphics.polygon('fill',b.x-bltbase,b.y,b.x+bltbase,b.y,b.x,b.y-bltbase)
    --TODO top check
  end
  
  
  if ply.dead==true then 
    love.graphics.print("GAME OVER",200,300,0, 6 ,6)
  end
  
  if victory==true then 
    love.graphics.print("VICTORY (^o^)",200,300,0, 6 ,6)
  end

  
end


updateGame=function()
  
    lcur=love.timer.getTime()
    if lasttime>0 then
      wavecountdown=wavecountdown-(lcur-lasttime)
      
    end
    lasttime=lcur
    
    if wavecountdown<0 then
      if waves[nextwave] == nil then
          --
      else
        waves[nextwave]()
        nextwave=nextwave+1
        wavecountdown=10
      end
    
    end
  
  
  
  
  if ply.dead==false then
      
    
    
    if love.keyboard.isDown('space') then
      if ply.cooldown<=0 then
        fire(ply.x,ply.y,10,-math.pi/2,bhvplyfire,rdrplyblt)
        ply.cooldown=dftplycooldown
      else 
        ply.cooldown=ply.cooldown-1
      end
      ply.spd=ply.holdspd
    else
      ply.spd=ply.tapspd
    end 

    if love.keyboard.isDown('left') then
      ply.x=ply.x-ply.spd
    end
    if love.keyboard.isDown('right') then
      ply.x=ply.x+ply.spd
    end
    if love.keyboard.isDown('up') then
      ply.y=ply.y-ply.spd
    end
    if love.keyboard.isDown('down') then
      ply.y=ply.y+ply.spd
    end
  end
  
  lvly=lvly+10
  
  
  
  --gos
  for i,o in ipairs (gos)
  do
    o.bhv(o)
    --TODO top check
  end
  
  --blts
  for i,b in ipairs (blts)
  do
    
    b.bhv(b,i)
    
    --TODO replace by bhv
--    if ccoll(ply.x,ply.y,defaultradius,b.x,b.y,bulletradius) then
--      print('game over')
--      love.event.quit()
--    end
    
--    b.x=b.x+b.vx
--    b.y=b.y+b.vy
  
  
  end
  
  if waves[nextwave]==nil and tablelength(gos)==0  then
    victory=true
    ply.resetcounter=2000
  end
  
  
  if ply.dead==true or victory==true then
    ply.resetcounter=ply.resetcounter-1
    if ply.resetcounter<0 then 
      love.event.quit("restart")
      
    end
      
  end
  
end


startGame = function()
  love.draw=drawGame
  love.update=updateGame

end