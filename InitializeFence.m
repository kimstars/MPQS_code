function [FencePlot] = InitializeFence(v_ImageFence, v_AlphaFence, FencePosition)
    % Xoay hình ?nh hang rao tr??c khi v?
    angle = FencePosition(4);
    rotatedImage = imrotate(v_ImageFence, angle);
    rotatedAlpha = imrotate(v_AlphaFence, angle);
    
    % V? hang rao t?i v? trí xác ??nh trên ?? th?
    FencePlot = image(FencePosition(2), FencePosition(1), rotatedImage);
    FencePlot.AlphaData = rotatedAlpha;
    
    % Thi?t l?p kích th??c c?a xe t?ng
    % set(TankPlot, 'XData', TankPosition(1)-width/2);
    % set(TankPlot, 'YData', TankPosition(2)-height/2);
    
    % Thi?t l?p các thu?c tính khác c?a xe t?ng (ví d?: màu s?c, ...)
    % ...
end