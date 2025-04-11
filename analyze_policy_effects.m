%% 政策有效性分析（图10-图13）
function analyze_policy_effects(params, tspan)
    % 政府补贴K1对金融机构的影响（图10）
    K1_values = [0.05, 0.10, 0.20, 0.30];
    figure;
    for i = 1:length(K1_values)
        params_mod = params;
        params_mod.K1 = K1_values(i);
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params_mod), tspan, [0.5, 0.5, 0.5]);
        plot(tspan, y(:,3), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('金融机构策略比例z');
    legend('K1 = 0.05', 'K1 = 0.10', 'K1 = 0.20', 'K1 = 0.30');
    title('图10: 政府补贴对金融机构策略的影响');
    grid on;

    % 政府惩罚K3对金融机构的影响（图11）
    K3_values = [0.05, 0.10, 0.20, 0.30];
    figure;
    for i = 1:length(K3_values)
        params_mod = params;
        params_mod.K3 = K3_values(i);
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params_mod), tspan, [0.5, 0.5, 0.5]);
        plot(tspan, y(:,3), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('金融机构策略比例z');
    legend('K3 = 0.05', 'K3 = 0.10', 'K3 = 0.20', 'K3 = 0.30');
    title('图11: 政府惩罚对金融机构策略的影响');
    grid on;

    % 企业补贴K2对政府策略的影响（图12）
    K2_values = [0.1, 0.2, 0.3, 0.4];
    figure;
    for i = 1:length(K2_values)
        params_mod = params;
        params_mod.K2 = K2_values(i);
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params_mod), tspan, [0.5, 0.5, 0.5]);
        plot(tspan, y(:,1), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('政府策略比例x');
    legend('K2 = 0.1', 'K2 = 0.2', 'K2 = 0.3', 'K2 = 0.4');
    title('图12: 企业补贴对政府策略的影响');
    grid on;

    % 企业补贴K2对企业策略的影响（图13）
    figure;
    for i = 1:length(K2_values)
        params_mod = params;
        params_mod.K2 = K2_values(i);
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params_mod), tspan, [0.5, 0.5, 0.5]);
        plot(tspan, y(:,2), 'LineWidth', 2); hold on;
    end
    xlabel('时间'); ylabel('企业策略比例y');
    legend('K2 = 0.1', 'K2 = 0.2', 'K2 = 0.3', 'K2 = 0.4');
    title('图13: 企业补贴对企业策略的影响');
    grid on;
end