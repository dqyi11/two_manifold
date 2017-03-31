X_data = [Z_data(1,:).*cos(Z_data(1,:)/10)/5; Z_data(1,:).*sin(Z_data(1,:)/10)/5; Z_data(2,:)];
Y_data = [(100-Z_data(1,:)).*sin((100-Z_data(1,:))/10)/5; (100-Z_data(1,:)).*cos((100-Z_data(1,:))/10)/5; Z_data(2,:)];

figure;
scatter3(X_data(1,:),X_data(2,:),X_data(3,:),30,color(:),'o');
title('3D Nonlinear Swiss Roll - X');

figure;
scatter3(Y_data(1,:),Y_data(2,:),Y_data(3,:),30,color(:),'o');
title('3D Nonlinear Swiss Roll - Y');