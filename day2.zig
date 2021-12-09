const std = @import("std");

const data = @embedFile("./day2.data");

// const data =
// \\forward 5
// \\down 5
// \\forward 8
// \\up 3
// \\down 8
// \\forward 2
// ;

pub fn main() !void {
  var it = std.mem.split(u8, data, "\n");

  var x: u64 = 0;
  var y: u64 = 0;
  var aim: u64 = 0;

  while(it.next()) |token| {
    if (std.mem.indexOf(u8, token, "forward") != null) {
      const n = try std.fmt.parseInt(u32, token[8..], 10);
      // increases your horizontal position by n units
      x += n;
      // increases your depth by your aim multiplied by n
      y += aim * n;
    } else if(std.mem.indexOf(u8, token, "down") != null) {
      const n = try std.fmt.parseInt(u32, token[5..], 10);
      // down n increases your aim by n units
      aim += n;
    } else {
      // up
      const n = try std.fmt.parseInt(u32, token[3..], 10);
      // up n decreases your aim by n units
      aim -= n;
    }
    // std.debug.print("{s} | x = {d}, y = {d}, aim = {d} \n", .{token, x, y, aim});
  }

  std.debug.print("x = {d}, y = {d}, product = {d} \n", .{x, y, x * y});
}