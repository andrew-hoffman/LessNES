-- This is the NES's memory
-- The NES has hardware mapped IO

RAM = {}

-- Initializes the system memory to have no data
function initializeRam()
	for i = 1, 2049 do
		RAM[i] = 0xFF
	end
end