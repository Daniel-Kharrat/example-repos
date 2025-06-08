local target_range = 6

-- Get arrange view start and end
local view_start, view_end = reaper.GetSet_ArrangeView2(0, false, 0, 0)
local view_center = (view_start + view_end) / 2

-- Calculate new start and end
local new_start = view_center - (target_range / 2)
local new_end = view_center + (target_range / 2)

-- Set arrange new start and end
reaper.PreventUIRefresh(1)
reaper.GetSet_ArrangeView2(0, true, 0, 0, new_start, new_end)
reaper.PreventUIRefresh(-1)
reaper.UpdateArrange()

