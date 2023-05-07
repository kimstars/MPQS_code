function [FencePlot] = InitializeFence(v_ImageFence, v_AlphaFence, FencePosition)
    % Xoay h�nh ?nh hang rao tr??c khi v?
    angle = FencePosition(4);
    rotatedImage = imrotate(v_ImageFence, angle);
    rotatedAlpha = imrotate(v_AlphaFence, angle);
    
    % V? hang rao t?i v? tr� x�c ??nh tr�n ?? th?
    FencePlot = image(FencePosition(2), FencePosition(1), rotatedImage);
    FencePlot.AlphaData = rotatedAlpha;
    
    % Thi?t l?p k�ch th??c c?a xe t?ng
    % set(TankPlot, 'XData', TankPosition(1)-width/2);
    % set(TankPlot, 'YData', TankPosition(2)-height/2);
    
    % Thi?t l?p c�c thu?c t�nh kh�c c?a xe t?ng (v� d?: m�u s?c, ...)
    % ...
end