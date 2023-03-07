local module = {}

function module:SeparateByComma(num)
    if not tonumber(num) then
        return ""
    end

	local formatted = num
	local cache
	
	while true do  
		formatted, cache = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if cache == 0 then
			break
		end
	end
	
	return formatted
end

function module:ShortNumber(num)
	local shorts = {"K","M","B","T","q","Q","s","S","O","N","d","U","D"}
	
    if not tonumber(num) then
        return ""
    end

	if num < 10000 then 
		return math.floor(num) 
	end
	
	local d = math.floor(math.log10(num)/3)*3
	local s = tostring(num/(10^d)):sub(1,5)
	
	return s..tostring(shorts[math.floor(d/3)]).."+"
end

return module