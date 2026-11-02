#!/usr/bin/env -S lua build.lua

-- Define Packages and constants
require ("luarocks.loader")
local gumbo = require("gumbo")

local input_file_path = "input.html"
local output_file_path = "output.html"

local document = assert(gumbo.parseFile(input_file_path))

local headings = document:getElementsByTagName("h1")

for _, element in ipairs(headings) do
    element.textContent = "I Changed this!!"
end


local file_output = io.open(output_file_path, "w")
document:serialize(file_output)