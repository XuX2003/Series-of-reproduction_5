%% 定义四组参数（对应表5）
params = struct();
params.I = struct('P1',0.8, 'P2',0.3, 'I1',0.4, 'C1',0.2, 'C2',0.5, 'C3',0.4,...
                 'C4',0.4, 'C5',0.3, 'K1',0.1, 'K2',0.2, 'K3',0.2, 'K4',0.3,...
                 'S1',1.0, 'S2',0.6);
params.II = struct('P1',0.8, 'P2',0.3, 'I1',0.4, 'C1',0.2, 'C2',0.8, 'C3',0.4,...
                  'C4',0.4, 'C5',0.3, 'K1',0.1, 'K2',0.05, 'K3',0.2, 'K4',0.3,...
                  'S1',1.0, 'S2',0.6);
params.III = struct('P1',0.8, 'P2',0.3, 'I1',0.05, 'C1',0.2, 'C2',0.5, 'C3',0.4,...
                   'C4',0.4, 'C5',0.3, 'K1',0.05, 'K2',0.2, 'K3',0.05, 'K4',0.3,...
                   'S1',1.0, 'S2',0.6);
params.IV = struct('P1',0.8, 'P2',0.3, 'I1',0.05, 'C1',0.2, 'C2',0.8, 'C3',0.4,...
                  'C4',0.4, 'C5',0.3, 'K1',0.05, 'K2',0.05, 'K3',0.05, 'K4',0.3,...
                  'S1',1.0, 'S2',0.6);

%% 图2-图5
tspan = 0:0.5:20; % 时间范围
initial = rand(100, 3); % 初始策略比例 [x0, y0, z0]
value = cell(100, 1); % 用于存储每一次的结果
for i = 1: 100
    [~, y] = ode45(@(t,y) tripartite_ode(t, y, params.IV), tspan, initial(i, :));
    value{i} = y;
end
hold on
for i = 1: 100
    y = value{i};
    % scatter3(y(1,1), y(1,2), y(1,3), 50, 'ro', 'filled', 'DisplayName','初始点');
    plot3(y(:,1), y(:,2), y(:,3), 'LineWidth', 1); % 改线条粗细
end
view(-30, 30); % 调整三维视角
xlim([0 1]);
ylim([0 1]);
zlim([0 1]);
xlabel('政府策略比例 x'); 
ylabel('企业策略比例 y'); 
zlabel('金融机构策略比例 z');
% scatter3(y(end,1), y(end,2), y(end,3), 100, 'g^', 'filled', 'DisplayName','稳定点');

%% 图6-图8
analyze_initial_conditions(params.I, tspan);

%% 图9
analyze_interest_rates(params.I, tspan);

%% 图10和图11
analyze_policy_effects(params.I, tspan);
