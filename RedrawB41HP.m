function Redrawb41HP()
    global b41;
    global b41Num;
    global b41HP;
    global BloodPos;
    global SizeHPBar;

    delete(b41HP);

    if (b41(1, 15) > 0)
        x1 = b41(1, 1) - 30;
        x2 = b41(1, 1) - 25 + b41(1, 15) / 10;
        y1 = b41(1, 2) + BloodPos +60;
        y2 = b41(1, 2) + BloodPos +60;
        b41HP(1) = plot([x1 x2], [y1 y2], '-', 'Color', 'r', 'LineWidth', SizeHPBar); %line([x1 x2],[y1 y2],'Color', 'red', 'LineStyle', '-');
    end

    drawnow;
end
