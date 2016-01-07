require 'hdf5'
local dir = require 'pl.dir'
local pretty = require 'pl.pretty'
local path = require 'pl.path'
local stringx = require 'pl.stringx'
local myTests = {}
local totem = require 'totem'
local tester = totem.Tester()
local testsDir = path.dirname(debug.getinfo(1).source:sub(2))

local testUtils = hdf5._testUtils

-- NOTE: "scalarStrings.h5" has a scalar float at /pi and an integer at /int, but these are not
--       implemented yet. For now we just read the string.

--[[
Attempts to read string at /str in scalarStrings.h5.
]]
function myTests.testReadString()
    local f = hdf5.open(path.join(testsDir, 'scalarsStrings.h5'), 'r')
    tester:asserteq(f:read('/str'):all(), "hello this is a string!", "failed to read string or string incorrect")
    f:close()
end

return tester:add(myTests):run()
