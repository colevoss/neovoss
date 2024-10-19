local M = {}

function M.merge(t1, t2)
	if not t2 then
		return t1
	end

	local n = {}

	for k, v in pairs(t1) do
		n[k] = v
	end

	for k, v in pairs(t2) do
		-- t1[k] = v
		n[k] = v
	end

	return n
end

return M
