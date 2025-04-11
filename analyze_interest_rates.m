%% 贷款利率影响分析（图9）
function analyze_interest_rates(params, tspan)
    I1_values = [0.05, 0.25, 0.4, 0.6];
    figure;
    for i = 1:length(I1_values)
        params_mod = params;
        params_mod.I1 = I1_values(i); % 修改贷款利率
        [~, y] = ode45(@(t,y) tripartite_ode(t, y, params_mod), tspan, [0.5, 0.5, 0.5]);
        plot(tspan, y(:,2), 'LineWidth', 2); hold on;
    end
    ylim([0.5, 1])
    xlabel('时间'); ylabel('企业策略比例y');
    legend('I1=0.05', 'I1=0.25', 'I1=0.4', 'I1=0.6');
    title('图9: 贷款利率对企业策略的影响');
    grid on;
end