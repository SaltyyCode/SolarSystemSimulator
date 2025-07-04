#include "SolarSystem.h"

int runwindow(void)
{
    openwindow();
    closewindow();
    return 0;
}

void openwindow(void)
{

    InitWindow(SCREENWIDTH, SCREENHEIGHT, WINDOWNAME);
    SetTargetFPS(60);
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Yo ça arrive", 400, 300, 20, BLACK);
        EndDrawing();
    }

}

void closewindow(void)
{
    CloseWindow();
}