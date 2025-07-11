const rl = @import("raylib");

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "ZigBindingsRaylibTest");
    defer rl.closeWindow();
    
    const blob = try rl.loadTexture("res/blob.png");
    defer rl.unloadTexture(blob);
    
    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        
        rl.clearBackground(.white);
        
        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
        rl.drawTexture(blob, 10, 10, .white);
    }
}