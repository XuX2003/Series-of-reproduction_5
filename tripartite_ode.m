%% 三方演化博弈微分方程定义
function dydt = tripartite_ode(t, y, params)
    x = y(1); % 政府建设比例
    y_e = y(2); % 企业数字化比例
    z = y(3); % 金融机构支持比例

    % 政府动态方程 F(x)
    Fx = x*(1-x)*(params.S1 - params.C4 + params.K4 - params.C5 - y_e*params.K2 - y_e*z*params.K1);

    % 企业动态方程 F(y)
    Fy = y_e*(1-y_e)*(x*params.K2 + params.P1 - params.C2 - params.C3 + params.S2 + ...
        z*(params.C2 - params.I1) - params.P2);

    % 金融机构动态方程 F(z)
    Fz = z*(1-z)*((params.K1 + params.K3)*x*y_e + y_e*params.I1 - params.C1);

    dydt = [Fx; Fy; Fz];
end







