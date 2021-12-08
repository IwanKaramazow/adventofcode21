const std = @import("std");

const data = @embedFile("./day1.data");

pub fn main() !void {
  var it = std.mem.tokenize(u8, data, "\n");

  var increases: u32 = 0;
  var prev: u32 = undefined;

  while (it.next()) |token| {
    const current = try std.fmt.parseInt(u32, token, 10);
    if(current > prev) {
      increases = increases + 1;
    }
    prev = current;
  }

  std.debug.print("increases: {d}\n", .{increases});
}