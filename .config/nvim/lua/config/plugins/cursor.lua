return {
  "sphamba/smear-cursor.nvim",
  enabled = false,
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = true,
    smear_insert_mode = false,
    cursor_color = "none",

    -- SMOOTH
    -- stiffness = 0.5,
    -- trailing_stiffness = 0.49,

    -- FAST
    stiffness = 0.8,                      -- 0.6      [0, 1]
    trailing_stiffness = 0.5,             -- 0.4      [0, 1]
    stiffness_insert_mode = 0.6,          -- 0.4      [0, 1]
    trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    distance_stop_animating = 0.5,        -- 0.1      > 0
  },
}
