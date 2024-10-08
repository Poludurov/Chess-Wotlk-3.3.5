--  Copyright (C) 2008 Tyson Brown
--  
--  This file is part of Chess, an AddOn for World of Warcraft.
--  
--  Chess is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--  
--  Chess is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with Chess.  If not, see <http://www.gnu.org/licenses/>.

local insert = table.insert
local wcheck, bcheck = _G.ChessInitData.white_check, _G.ChessInitData.black_check
local floor = math.floor

-- Moves for white rooks.
_G.ChessInitData.piece_enum[2] = function(i, state, out, king)
  local file, rank = i%8, floor(i/8)*8
  
  state[i] = 0
  
  -- Move right.
  for i=i+1,rank+7 do
    local n = state[i]
    
    -- Hit our own piece.
    if n > 0 then break end
    
    state[i] = 2
    if wcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    
    -- Stop, hit something.
    if n ~= 0 then break end
  end
  
  -- Move left.
  for i=i-1,rank,-1 do
    local n = state[i]
    if n > 0 then break end
    state[i] = 2
    if wcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  -- Move up
  for i=i+8,63,8 do
    local n = state[i]
    if n > 0 then break end
    state[i] = 2
    if wcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  -- Move down
  for i=i-8,file,-8 do
    local n = state[i]
    if n > 0 then break end
    state[i] = 2
    if wcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  state[i] = 2
end

-- Moves for black rooks.
_G.ChessInitData.piece_enum[-2] = function(i, state, out, king)
  local file, rank = i%8, floor(i/8)*8
  
  state[i] = 0
  
  -- Move right.
  for i=i+1,rank+7 do
    local n = state[i]
    if n < 0 then break end
    state[i] = -2
    if bcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  -- Move left.
  for i=i-1,rank,-1 do
    local n = state[i]
    if n < 0 then break end
    state[i] = -2
    if bcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  -- Move up
  for i=i+8,63,8 do
    local n = state[i]
    if n < 0 then break end
    state[i] = -2
    if bcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  -- Move down
  for i=i-8,file,-8 do
    local n = state[i]
    if n < 0 then break end
    state[i] = -2
    if bcheck(king, state) then
      insert(out, i)
    end
    state[i] = n
    if n ~= 0 then break end
  end
  
  state[i] = -2
end
