clc; clear; close all;

%% ================== 고정 파라미터 ==================
L78 = 63.2;
ang87 = 30.42;

L84 = 200;
L45 = 50;
L24 = 130;
ANG_46_45 = 112.72;

L12 = 40;
L13 = 30;

rP2 = sqrt(189^2 + 90^2);
rP4 = 80;

%% ================== 색상 ==================
clrLink   = [0.53 0.81 0.92];    % 하늘색(기본)
clrNode   = [0 0 0];             % 검정(노드)
clrOrange = [1.0 0.55 0.0];      % 주황
clrPurple = [0.55 0.0 0.75];     % 보라

%% ================== 고정 점 (2D 계산용) ==================
P8 = [0, 0];
P7 = P8 + L78 * [cosd(ang87), sind(ang87)];

%% ================== 목표들 (P1, 2D 좌표) : 원 궤적 ==================
circleCenter = [-300, 0];   % 원 중심 [X, Y] mm
circleR = 50;               % 원 반지름 mm
nCircle = 72;               % 원을 나눌 점 개수, 클수록 부드러움

theta = linspace(0, 360, nCircle+1).';
theta(end) = [];            % 360도 중복 제거

targets2d = [
    circleCenter(1) + circleR*cosd(theta), ...
    circleCenter(2) + circleR*sind(theta)
];

% 마지막에 시작점 한 번 더 추가해서 원 닫기
targets2d(end+1,:) = targets2d(1,:);

%% ================== 초기 자세 ==================
beta1 = 120;
t2   = 130;

%% ================== 설정 ==================
% 처음 원 시작점까지 접근할 때
gain_slow = 0.04;
dt_slow   = 0.025;

% 원을 따라 움직일 때
gain_fast = 0.15;
dt_fast   = 0.008;

w_xy  = 3000;
w_tri = 50;
w_reg = 0.25;

%% ================== Figure (2D) ==================
figure('Color','w');
ax = axes('Parent',gcf);
hold(ax,'on'); grid(ax,'on'); axis(ax,'equal');
xlabel(ax,'X [mm]'); ylabel(ax,'Y [mm]');
axis(ax,[-450 450 -450 450]);

%% ================== (뒤 레이어) 하늘/보라/기타 ==================
h46 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);
h67 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);
h78 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);

h23 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);
h35 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);
h54 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);

h12 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);
h13 = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);

hC  = plot(ax,nan,nan,'LineWidth',2,'Color',clrLink);

% 보라(뒤 레이어)
h24 = plot(ax,nan,nan,'LineWidth',2,'Color',clrPurple);
h48 = plot(ax,nan,nan,'LineWidth',2,'Color',clrPurple);

% 실제 이동 궤적은 표시하지 않음
hPath = plot(ax,nan,nan,'LineWidth',1.5,'Color',clrNode,'Visible','off');

%% ================== (중간 레이어) 주황 ==================
h24_9 = plot(ax,nan,nan,'LineWidth',2,'Color',clrOrange);
h44_9 = plot(ax,nan,nan,'LineWidth',2,'Color',clrOrange);
h8_10 = plot(ax,nan,nan,'LineWidth',2,'Color',clrOrange);
h9_10 = plot(ax,nan,nan,'LineWidth',2,'Color',clrOrange);

%% ================== (앞 레이어) 검정 노드/번호 ==================
hOrigin = plot(ax,0,0,'ko','MarkerFaceColor','k','MarkerSize',7);

hPts   = plot(ax,nan,nan,'.','MarkerSize',18,'Color',clrNode);
hP1n   = plot(ax,nan,nan,'.','MarkerSize',18,'Color',clrNode);
hP1ring= plot(ax,nan,nan,'o','MarkerSize',9,'LineWidth',1.2,'Color',clrNode);

tNum = gobjects(1,10);
for k=1:10
    tNum(k)=text(ax,nan,nan,'','FontSize',12,'FontWeight','bold','Color',clrNode);
end

%% ================== 목표 원 표시(2D) ==================
plot(ax,targets2d(:,1), targets2d(:,2), '-', ...
    'Color',[1 0 0], 'LineWidth',1.5);

%% ================== 초기 Forward ==================
[ok, pts2d] = forward_from_beta1_t2_2d( ...
    beta1, t2, P8, P7, ...
    L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4);

if ~ok
    error('초기 자세(beta1,t2)에서 해가 안 나옵니다. beta1/t2 초기값을 바꿔야 합니다.');
end

update_frame_2d( ...
    h46,h67,h78,h23,h35,h54,h12,h13,hC, ...
    h24,h48, ...
    h24_9,h44_9,h8_10,h9_10, ...
    hPts,hP1n,hP1ring,tNum, ...
    pts2d);

title(ax,'Robotic Arm Simulation with Ground-Parallel End-Effector');
drawnow; pause(1.0);

%% ================== 목표 순차 이동 ==================
P1_now = pts2d(1,:);
pathX = P1_now(1);
pathY = P1_now(2);
set(hPath,'XData',pathX,'YData',pathY);

for tgt = 1:size(targets2d,1)

    P1_target = targets2d(tgt,:);

    while true
        P1_now = pts2d(1,:);

        % 첫 번째 목표점까지는 느리게, 이후 원 궤적은 빠르게
        if tgt == 1
            gain_now = gain_slow;
            dt_now   = dt_slow;
        else
            gain_now = gain_fast;
            dt_now   = dt_fast;
        end

        P1_des = P1_now + gain_now*(P1_target - P1_now);

        x0 = [beta1, t2];
        obj = @(x) cost_for_P1_xy_2d(x, P1_des, x0, ...
            P8, P7, L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4, ...
            w_xy, w_tri, w_reg);

        x = fminsearch(obj, x0, optimset('Display','off'));
        beta1 = x(1);
        t2   = x(2);

        [ok, pts2d] = forward_from_beta1_t2_2d( ...
            beta1, t2, P8, P7, ...
            L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4);

        if ~ok
            warning('목표 (%.0f,%.0f)로 가는 중 해가 끊겼습니다.', P1_target(1), P1_target(2));
            break;
        end

        update_frame_2d( ...
            h46,h67,h78,h23,h35,h54,h12,h13,hC, ...
            h24,h48, ...
            h24_9,h44_9,h8_10,h9_10, ...
            hPts,hP1n,hP1ring,tNum, ...
            pts2d);

        P1_now = pts2d(1,:);
        pathX(end+1)=P1_now(1);
        pathY(end+1)=P1_now(2);
        set(hPath,'XData',pathX,'YData',pathY);

        drawnow limitrate nocallbacks;
        pause(dt_now);

        if norm(P1_target - pts2d(1,:)) < 1.0
            if tgt == 1
                pause(0.2);     % 원 시작점 도착 후 잠깐 정지
            else
                pause(0.005);
            end
            break;
        end
    end
end

disp('원 궤적 완료');

%% ================== 2D 프레임 업데이트 ==================
function update_frame_2d( ...
    h46,h67,h78,h23,h35,h54,h12,h13,hC, ...
    h24,h48, ...
    h24_9,h44_9,h8_10,h9_10, ...
    hPts,hP1n,hP1ring,tNum, ...
    pts)

P1  = pts(1,:);  P2  = pts(2,:);  P3  = pts(3,:);
P4  = pts(4,:);  P5  = pts(5,:);  P6  = pts(6,:);
P7  = pts(7,:);  P8  = pts(8,:);  P9  = pts(9,:);
P10 = pts(10,:);

% 하늘
set(h46,'XData',[P4(1) P6(1)],'YData',[P4(2) P6(2)]);
set(h67,'XData',[P6(1) P7(1)],'YData',[P6(2) P7(2)]);
set(h78,'XData',[P7(1) P8(1)],'YData',[P7(2) P8(2)]);

set(h23,'XData',[P2(1) P3(1)],'YData',[P2(2) P3(2)]);
set(h35,'XData',[P3(1) P5(1)],'YData',[P3(2) P5(2)]);
set(h54,'XData',[P5(1) P4(1)],'YData',[P5(2) P4(2)]);

set(h12,'XData',[P1(1) P2(1)],'YData',[P1(2) P2(2)]);
set(h13,'XData',[P1(1) P3(1)],'YData',[P1(2) P3(2)]);

set(hC,'XData',[P5(1) P6(1)],'YData',[P5(2) P6(2)]);

% 보라
set(h24,'XData',[P2(1) P4(1)],'YData',[P2(2) P4(2)]);
set(h48,'XData',[P4(1) P8(1)],'YData',[P4(2) P8(2)]);

% 주황(중간)
set(h24_9,'XData',[P2(1) P9(1)],'YData',[P2(2) P9(2)]);
set(h44_9,'XData',[P4(1) P9(1)],'YData',[P4(2) P9(2)]);
set(h8_10,'XData',[P8(1) P10(1)],'YData',[P8(2) P10(2)]);
set(h9_10,'XData',[P9(1) P10(1)],'YData',[P9(2) P10(2)]);

% 노드(앞)
set(hPts,'XData',pts(:,1),'YData',pts(:,2));
set(hP1n,'XData',P1(1),'YData',P1(2));
set(hP1ring,'XData',P1(1),'YData',P1(2));

for k=1:10
    set(tNum(k),'Position',pts(k,:), 'String',sprintf('  %d',k));
end
end

%% ================== Cost ==================
function J = cost_for_P1_xy_2d(x, P1_des, x_prev, ...
    P8, P7, L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4, ...
    w_xy, w_tri, w_reg)

beta1 = x(1);
t2   = x(2);

if ~isfinite(beta1) || ~isfinite(t2) || abs(beta1)>720 || abs(t2)>720
    J = 1e9; return;
end

[ok, pts] = forward_from_beta1_t2_2d(beta1, t2, ...
    P8, P7, L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4);

if ~ok
    J = 1e9; return;
end

P1 = pts(1,:);
P3 = pts(3,:);

e_xy  = norm(P1 - P1_des);
e_tri = abs(norm(P3 - P1) - L13);
e_reg = abs(beta1 - x_prev(1)) + 0.7*abs(t2 - x_prev(2));

J = w_xy*e_xy^2 + w_tri*e_tri^2 + w_reg*e_reg^2;
end

%% ================== Forward ==================
function [ok, pts] = forward_from_beta1_t2_2d( ...
    beta1, t2, P8, P7, L84, L45, L24, ANG_46_45, L12, L13, rP2, rP4)

ok = false;
pts = nan(10,2);

theta_real = 180 - beta1;

v84 = L84 * [cosd(theta_real), sind(theta_real)];
P4 = P8 + v84;
P6 = P7 + v84;

v46 = P6 - P4;
if norm(v46) < 1e-9, return; end
u46 = v46 / norm(v46);

u45 = rot2d(u46, ANG_46_45);
P5 = P4 + L45 * u45;

u48 = (P8 - P4);
if norm(u48) < 1e-9, return; end
u48 = u48 / norm(u48);

u42_ref = rot2d(u48, 180);
u42 = rot2d(u42_ref, t2);
if norm(u42) < 1e-9, return; end
u42 = u42 / norm(u42);

P2 = P4 + L24*u42;
P3 = P2 + (P5 - P4);

P1a = [P2(1)+L12, P2(2)];
P1b = [P2(1)-L12, P2(2)];

if abs(norm(P3 - P1a) - L13) <= abs(norm(P3 - P1b) - L13)
    P1 = P1a;
else
    P1 = P1b;
end

try
    [P9a, P9b] = circleCircleIntersection(P2, rP2, P4, rP4);
    if P9a(2) > P9b(2)
        P9 = P9a;
    else
        P9 = P9b;
    end
catch
    return;
end

P10 = P8 + (P9 - P4);

pts = [P1;P2;P3;P4;P5;P6;P7;P8;P9;P10];
ok = true;
end

%% ================== 2D 회전 함수 ==================
function v2 = rot2d(v, angDeg)
R = [cosd(angDeg) -sind(angDeg); sind(angDeg) cosd(angDeg)];
v2 = (R * v(:)).';
end

%% ================== 원-원 교점 함수 ==================
function [X1, X2] = circleCircleIntersection(C1, r1, C2, r2)
d = norm(C2 - C1);

if d > r1+r2 || d < abs(r1-r2) || d == 0
    error('원 교점 없음');
end

a = (r1^2 - r2^2 + d^2)/(2*d);
h = sqrt(max(r1^2 - a^2, 0));

P0 = C1 + a*(C2-C1)/d;
perp = [-(C2(2)-C1(2)), (C2(1) - C1(1))]/d;

X1 = P0 + h*perp;
X2 = P0 - h*perp;
end