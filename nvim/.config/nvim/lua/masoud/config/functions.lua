-- Function to copy lines containing a pattern into a new buffer
function ExtractText(pattern)
  -- Store the original buffer number explicitly
  local original_buf = vim.api.nvim_get_current_buf()
 
  -- Create a new tab and open a new buffer in it
  vim.cmd("tabnew")
 
  -- Store the new buffer number (the buffer in the new tab)
  local new_buf = vim.api.nvim_get_current_buf()
 
  -- Set the new buffer's name to the pattern
  vim.api.nvim_buf_set_name(new_buf, pattern)
 
  -- Get the content of the original buffer as a list of lines
  local lines = vim.api.nvim_buf_get_lines(original_buf, 0, -1, false)
 
  -- Create a table to hold lines that match the pattern
  local matching_lines = {}
 
  -- Iterate through each line and check if it matches the pattern using Vim's regex
  for _, line in ipairs(lines) do
    if vim.fn.match(line, pattern) ~= -1 then
      table.insert(matching_lines, line)
    end
  end
 
  -- Set the matching lines in the new buffer
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, matching_lines)
end
 
-- Define a custom command :CopyToBuffer that takes a pattern as argument
vim.api.nvim_create_user_command('Extract', function(opts)
  ExtractText(opts.args)
end, { nargs = 1 })
 
-- Map the function to a key (e.g., <leader>c) and ask for the pattern
vim.api.nvim_set_keymap('n', '<leader>fi', ':lua ExtractText(vim.fn.input("Pattern: "))<CR>',
  { noremap = true, silent = true })
