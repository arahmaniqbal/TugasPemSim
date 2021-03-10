from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import numpy as np
import matplotlib.pyplot as plt

X_train = np.array([17, 22, 21, 20, 22, 10, 20, 23, 24, 16, 21, 20, 20, 20, 25, 27,
                    28, 21, 26, 24, 27, 23, 24, 23, 22, 21, 11, 25, 26, 20])
y_train = np.array([10, 5, 9, 3, 9, 4, 5, 9, 18, 13, 10, 4, 7,
                    3, 12, 13, 16, 6, 14, 12, 16, 9, 13, 11, 7, 5, 7, 11, 13, 9])
X_train = X_train.reshape(-1, 1)
y_train = y_train.reshape(-1, 1)

model_reg = LinearRegression()
model_reg.fit(X_train, y_train)
print('Coefficients b = {}'.format(model_reg.coef_))
print('Constant a ={} '.format(model_reg.intercept_))

b = (model_reg.intercept_, model_reg.coef_)
x=X_train
y=y_train
plt.scatter(x, y, color="m", marker="o", s=30)
y_pred = b[0] + b[1] * x
plt.plot(x, y_pred, color="g")
plt.xlabel('x')
plt.ylabel('y')
plt.show()
    #plot_regression_line(X_train, y_train, b)
