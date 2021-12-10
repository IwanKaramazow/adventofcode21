const std = @import("std");

const data = @embedFile("./day1.data");

fn part1() !void {
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

pub fn main() !void {
  var it = std.mem.tokenize(u8, data, "\n");

  var increases: u32 = 0;

  // initialise first window
  var window: [3]u32 = .{
    try std.fmt.parseInt(u32, it.next().?, 10),
    try std.fmt.parseInt(u32, it.next().?, 10),
    try std.fmt.parseInt(u32, it.next().?, 10),
  };

  var prev_sum: u32 = window[0] + window[1] + window[2];

  var i: u32 = 0;
  while(it.next()) |token| {
    const n = try std.fmt.parseInt(u32, token, 10);
    // setup next window
    window[i % 3] = n;
    i += 1;

    const next_sum = window[0] + window[1] + window[2];

    if(next_sum > prev_sum) increases += 1;
    prev_sum = next_sum;
  }

  std.debug.print("increases: {d}\n", .{increases});
}