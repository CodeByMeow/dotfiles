local M = {}

function M.cowboy()
	local id
	local ok = true
	for key, value in pairs({ h = "h", n = "j", e = "k", i = "l" }) do
		local count = 0
		---@diagnostic disable-next-line: undefined-field
		local timer = assert(vim.loop.new_timer())
		local map = value
		vim.keymap.set("n", key, function()
			if vim.v.count > 0 then
				count = 0
			end

			if count >= 10 then
				ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
					icon = "🤠",
					replace = id,
					keep = function()
						return count >= 10
					end,
				})
				if not ok then
					id = nil
					return map
				end
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

return M
