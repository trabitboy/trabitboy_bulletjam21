
initTitle=function()
  love.update=updateTitle
  love.draw=drawTitle
  
end


drawTitle=function()
  
    love.graphics.print("Trabitboy bullet jam 2021",20,200,0,6,6)
    love.graphics.print("press space to shoot ",200,400,0,6,6)
    love.graphics.print("arrows to move ",200,600,0,6,6)
  
end



updateTitle=function()
  
  if love.keyboard.isDown("space") then
      startGame()
  end
  
end
