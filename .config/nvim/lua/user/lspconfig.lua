local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr))
end

vim.keymap.set("n", "<leader>.", function()
	M.toggle_inlay_hints()
end, { desc = "Toggle Inlay Hints" })

function M.config()
	local lspconfig = require("lspconfig")
	local servers = require("mason-lspconfig").get_installed_servers()
	local icons = require("user.icons").diagnostics

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	require("lspconfig.ui.windows").default_options.border = "rounded"
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = M.common_capabilities(),
		}

		local require_ok, settings = pcall(require, "user.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		lspconfig[server].setup(opts)
	end

	vim.diagnostic.config({
		virtual_text = false,
	})

	-- Show diagnostic current line only
	local ns = vim.api.nvim_create_namespace("CurlineDiag")
	vim.opt.updatetime = 100
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = args.buf,
				callback = function()
					pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
					local hi = { "Error", "Warn", "Info", "Hint" }
					local curline = vim.api.nvim_win_get_cursor(0)[1]
					local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
					local virt_texts = { { (" "):rep(4) } }
					for _, diag in ipairs(diagnostics) do
						virt_texts[#virt_texts + 1] =
							{ icons[hi[diag.severity]] .. diag.message, "Diagnostic" .. hi[diag.severity] }
					end
					vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
						virt_text = virt_texts,
						hl_mode = "combine",
					})
				end,
			})
		end,
	})
end

return M
