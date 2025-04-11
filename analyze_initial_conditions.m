%% 初始比例影响分析（图6-图8）
function analyze_initial_conditions(params, tspan)
    initial_x = [0.2, 0.5, 0.7];
    initial_y = [0.2, 0.5, 0.7];
    initial_z = [0.2, 0.5, 0.7];

    % 政府初始比例影响（图6）
    figure;
    for i = 1:length(initial_x)
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params), tspan, [initial_x(i), 0.5, 0.5]);
        hold on;
        scatter(tspan, y(:,1));
        plot(tspan, y(:,1), 'LineWidth', 2); 
    end
    xlabel('时间'); ylabel('政府策略比例x');
    legend('x0=0.2', 'x0=0.5', 'x0=0.7');
    title('图6: 政府的策略选择比例变化趋势');
    grid on;

    % 企业初始比例影响（图7）
    figure;
    for i = 1:length(initial_y)
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params), tspan, [0.5, initial_y(i), 0.5]);
        plot(tspan, y(:,2), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('企业策略比例y');
    legend('y0=0.2', 'y0=0.5', 'y0=0.7');
    title('图7: 企业的策略选择比例变化趋势');
    grid on;

    % 金融机构初始比例影响（图8）
    figure;
    for i = 1:length(initial_z)
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params), tspan, [0.5, 0.5, initial_z(i)]);
        plot(tspan, y(:,3), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('金融机构策略比例z');
    legend('z0=0.2', 'z0=0.5', 'z0=0.7');
    title('图8: 金融机构的策略选择比例变化趋势');
    grid on;
end