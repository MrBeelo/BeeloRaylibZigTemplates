const crl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    crl.InitWindow(screenWidth, screenHeight, "OriginalRaylibTest");
    defer crl.CloseWindow();
    
    const blob = crl.LoadTexture("res/blob.png");
    defer crl.UnloadTexture(blob);
    
    crl.SetTargetFPS(60);

    while (!crl.WindowShouldClose()) {
        crl.BeginDrawing();
        defer crl.EndDrawing();

        crl.ClearBackground(crl.WHITE);

        crl.DrawText("Congrats! You created your first window!", 190, 200, 20, crl.LIGHTGRAY);
        crl.DrawTexture(blob, 10, 10, crl.WHITE);
    }
}