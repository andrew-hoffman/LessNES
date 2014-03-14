-- This is the NES's memory
-- The NES has hardware mapped IO

-- Mapper
require("Mapper")

-- APU
require("APU")

-- PPU
require("PPU")

-- The RAM
RAM = {}

-- Program Loaded Status

-- Initializes the system memory to have no data
function initializeMemory()
	for i = 1, 2049 do
		RAM[i] = tonumber("0xFF")
	end
end

-- Maps memory reads to the correct locations
function readMemory(address)
    if tonumber(address) > tonumber("0x4018") then
        return readCart(tonumber(address))
		
    elseif tonumber(address) <= tonumber("0x1FFF") then
        return RAM[tonumber(address) and tonumber("0x7FF")]
		
	elseif tonumber(address) <= tonumber("0x3FFF") then
        return readPPU(tonumber(address) and 7)
		
	elseif tonumber("0x4000") <= tonumber(address) then
		if tonumber(address) <= tonumber("0x4018") then
			return readAPU((tonumber(address) - tonumber("0x4000")))
		end
	else
		-- Open bus
    end
end

-- Maps memory writes into correct locations
function writeMemory(address, data)
    if tonumber(address) > tonumber("0x4018") then
        writeCart(tonumber(address), tonumber(data));
		
    elseif tonumber(addr) <= tonumber("0x1FFF") then
        RAM[tonumber(address) and tonumber("0x7FF")] = data;
		
    elseif tonumber(addr) <= tonumber("0x3FFF") then
        writePPU(tonumber(address) and 7, data);
		
    elseif tonumber("0x4000") <= tonumber(addr) then
		if tonumber(addr) <= tonumber("0x4018") then
			writeAPU(tonumber(address) - tonumber("0x4000"), tonumber(data));
		end
	end
end
