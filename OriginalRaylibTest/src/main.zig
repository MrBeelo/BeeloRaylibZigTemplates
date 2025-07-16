const std = @import("std");

const crl = @cImport({
    @cInclude("raylib.h");
});

pub var buf: [64]u8 = undefined;

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    crl.InitWindow(screenWidth, screenHeight, "OriginalRaylibTest");
    defer crl.CloseWindow();
    
    const blob = crl.LoadTexture("res/blob.png");
    defer crl.UnloadTexture(blob);

    while (!crl.WindowShouldClose()) {
        crl.BeginDrawing();
        defer crl.EndDrawing();

        crl.ClearBackground(crl.WHITE);

        crl.DrawText("Congrats! You created your first window!", 190, 200, 20, crl.LIGHTGRAY);
        crl.DrawTexture(blob, 400 - @divFloor(blob.width, 2) , 150, crl.WHITE);
        crl.DrawText(try std.fmt.bufPrintZ(&buf, "FPS: {d:.1}", .{crl.GetFPS()}), 10, 10, 32, crl.LIGHTGRAY);
    }
}
