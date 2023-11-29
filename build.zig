const std = @import("std");

pub fn build(b: *std.Build) !void {
    const binding = b.addModule("binding", .{
        .source_file = .{ .path = "src/binding/sdl.zig" },
    });
    _ = b.addModule("wrapper", .{ .source_file = .{ .path = "src/wrapper/sdl.zig" }, .dependencies = &.{.{
        .name = "sdl-binding",
        .module = binding,
    }} });
}
