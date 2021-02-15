<!-- 
!!!! IMPORTANT: run `source("utils/render.R")` to publish instead of clicking on 'Knit'
-->

Packages
--------

Introduction
============

![Build](https://github.com/RealityBending/TemplateResults/workflows/Build/badge.svg)
[![Website](https://img.shields.io/badge/repo-Readme-2196F3)](https://github.com/RealityBending/TemplateResults)
[![Website](https://img.shields.io/badge/visit-website-E91E63)](https://realitybending.github.io/TemplateResults/)
[![Website](https://img.shields.io/badge/download-.docx-FF5722)](https://github.com/RealityBending/TemplateResults/raw/main/word_and_pdf/SupplementaryMaterials.docx)
[![Website](https://img.shields.io/badge/see-.pdf-FF9800)](https://github.com/RealityBending/TemplateResults/blob/main/word_and_pdf/SupplementaryMaterials.pdf)

Sliding windows
===============

``` python
import sys
sys.path.insert(1, 'libs/')

import dynfc as dyn
import numpy as np
from numpy.random import seed, rand
import scipy as sc
from scipy import io
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook
import matplotlib.cm as cm
import matplotlib.patches as patches

font = {'weight' : 'regular',
        'size'   : 24}
plt.rc('font', **font)

ts = sc.io.loadmat('data/ts.mat')['ts']
ts = ts.transpose()

corr_mats, idx = dyn.corr_slide(ts,300,50)

idx.shape
```

    > (24,)

``` python
a = [1,1,1,1,1.6]

fig,ax = plt.subplots(1)
fig.set_figheight(10)
fig.set_figwidth(20)
plt.style.use('tableau-colorblind10')
for i in range(5):
    
    plt.plot(2*i*a[i] + ts[i,]/1.4)   
    
```

    > [<matplotlib.lines.Line2D object at 0x7fc394d55208>]
    > [<matplotlib.lines.Line2D object at 0x7fc394d55278>]
    > [<matplotlib.lines.Line2D object at 0x7fc394d55588>]
    > [<matplotlib.lines.Line2D object at 0x7fc394d55860>]
    > [<matplotlib.lines.Line2D object at 0x7fc394d55b38>]

``` python
plt.xlabel('Time [TRs]')
```

    > Text(0.5, 0, 'Time [TRs]')

``` python
plt.ylabel('BOLD')
```

    > Text(0, 0.5, 'BOLD')

``` python
ax.tick_params(left=False)
ax.set_yticklabels([])
```

    > [Text(0, -2.0, ''), Text(0, 0.0, ''), Text(0, 2.0, ''), Text(0, 4.0, ''), Text(0, 6.0, ''), Text(0, 8.0, ''), Text(0, 10.0, ''), Text(0, 12.0, ''), Text(0, 14.0, ''), Text(0, 16.0, '')]

``` python
ax.set_ylim(-3,15.4)
```

    > (-3.0, 15.4)

``` python
ax.set_xlim(0,1200)
```

    > (0.0, 1200.0)

``` python
rect = patches.Rectangle((idx[0],-2.8),300,18,linewidth=4,edgecolor='#595959',facecolor='none')
ax.add_patch(rect)
```

    > <matplotlib.patches.Rectangle object at 0x7fc394b28128>

``` python
rect = patches.Rectangle((idx[5],-2.8),300,18,linewidth=4,edgecolor='#A56B6B',facecolor='none')
ax.add_patch(rect)
```

    > <matplotlib.patches.Rectangle object at 0x7fc394b34198>

``` python
rect = patches.Rectangle((idx[9],-2.8),300,18,linewidth=4,edgecolor='#CE3E3E',facecolor='none')
ax.add_patch(rect)
```

    > <matplotlib.patches.Rectangle object at 0x7fc394b34470>

``` python
rect = patches.Rectangle((idx[16],-2.8),300,18,linewidth=4,edgecolor='#FF0000',facecolor='none')
ax.add_patch(rect)
```

    > <matplotlib.patches.Rectangle object at 0x7fc3921d09b0>

``` python
plt.show()
```

![](figures/unnamed-chunk-1-1.png)

``` python
import sys
sys.path.insert(1, 'libs/')

import dynfc as dyn
import numpy as np
from numpy.random import seed, rand
import scipy as sc
from scipy import io
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook
import matplotlib.cm as cm
import matplotlib.patches as patches

aa = plt.figure(figsize = [6,6])
ax = sns.heatmap(corr_mats[:,:,0], 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = True, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
    
plt.show()
```

![](figures/unnamed-chunk-1-3.png)

``` python
aa = plt.figure(figsize = [6,6])
ax = sns.heatmap(corr_mats[:,:,5], 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = True, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
    
plt.show()
```

![](figures/unnamed-chunk-1-4.png)

``` python
aa = plt.figure(figsize = [6,6])
ax = sns.heatmap(corr_mats[:,:,9], 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = True, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
    
plt.show()
```

![](figures/unnamed-chunk-1-5.png)

``` python
aa = plt.figure(figsize = [6,6])
ax = sns.heatmap(corr_mats[:,:,16], 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = True, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
    
plt.show()
```

![](figures/unnamed-chunk-1-6.png)

Cofluctuations
==============

``` python
import sys
sys.path.insert(1, 'libs/')

import numpy as np
import scipy as sc
from scipy import io
import dynfc as dyn
import seaborn as sns
import matplotlib.pyplot as plt

ts = sc.io.loadmat('data/ts.mat')['ts']
ts = ts.transpose()

mat1, rss = dyn.corr_slide(ts,24)
mat1 = mat1[:,:,0]

aa = plt.figure(figsize = [6,6])
ax = sns.heatmap(mat1, 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = False, 
                 cbar = True)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
plt.show()
```

![](figures/unnamed-chunk-1-11.png)

``` python
upt = np.triu_indices(mat1.shape[0], k = 1)
vec = (mat1[upt])

toPlot = np.zeros((vec.shape[0],1))
toPlot[:,0] = vec

aa = plt.figure(figsize = (12/50,4))
ax = sns.heatmap(toPlot[:,0:1], 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = False, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 1.0, 19900.0, 0.0)

``` python
plt.show()
```

![](figures/unnamed-chunk-1-12.png)

``` python
edges_series, corr_mats, rss = dyn.cofluct(ts, 24)

aa = plt.figure(figsize = (12,4))
ax = sns.heatmap(edges_series, 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = False, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 1200.0, 19900.0, 0.0)

``` python
plt.show()
```

![](figures/unnamed-chunk-1-13.png)

\#Phase difference

``` python
import sys
sys.path.insert(1, 'libs/')

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from mpl_toolkits.mplot3d import Axes3D

theta = np.linspace(0*np.pi, 8*np.pi, 100)
time = np.linspace(0, 8, 100)
y1 = np.sin(theta)
x1 = np.cos(theta)
y2 = np.sin(theta + np.pi/2)
x2 = np.cos(theta + np.pi/2)
r = time/np.max(time)
ones = np.ones(time.shape[0])

fig = plt.figure()
ax = fig.add_subplot(projection='3d')
plt.style.use('classic')

ax.plot(time, x1, y1, color = '#67001f', linewidth=2)
```

    > [<mpl_toolkits.mplot3d.art3d.Line3D object at 0x7fc2eef43b00>]

``` python
ax.plot(time,ones,y1, linestyle = '--', color = '#0f0f0f')
```

    > [<mpl_toolkits.mplot3d.art3d.Line3D object at 0x7fc2eef4e048>]

``` python
ax.plot(time,x1,-ones, linestyle = '--', color = '#0f0f0f')
```

    > [<mpl_toolkits.mplot3d.art3d.Line3D object at 0x7fc2eef4e1d0>]

``` python
ax.quiver(time,0,0,0, 0.99*x1, 0.99*y1, 
          length = 0.9, 
          normalize = False, 
          arrow_length_ratio = 0.1, 
          alpha = 0.4, 
          color = '#053061')
```

    > <mpl_toolkits.mplot3d.art3d.Line3DCollection object at 0x7fc2eef4e550>

``` python
ax.text(0.5, 1, 0.5, r'$\sin(\theta)$', fontsize = 20)
```

    > Text(0.5, 1, '$\\sin(\\theta)$')

``` python
ax.text(0.5, -1, -1, r'$\cos(\theta)$', fontsize = 20)
```

    > Text(0.5, -1, '$\\cos(\\theta)$')

``` python
ax.set_xlabel('Time')
```

    > Text(0.5, 0, 'Time')

``` python
ax.set_ylabel('Re')
```

    > Text(0.5, 0, 'Re')

``` python
ax.set_zlabel('Im')
```

    > Text(0.5, 0, 'Im')

``` python
ax.set_xlim(0,8)
```

    > (0.0, 8.0)

``` python
ax.set_ylim(-1,1)
```

    > (-1.0, 1.0)

``` python
ax.set_zlim(-1,1)
```

    > (-1.0, 1.0)

``` python
plt.show()
```

![](figures/unnamed-chunk-1-17.png)

``` python
colors1 = plt.cm.Reds(np.arange(0,1,0.01))
colors1[:,-1] = np.arange(0,1,0.01)

colors2 = plt.cm.Blues(np.arange(0,1,0.01))
colors2[:,-1] = np.arange(0,1,0.01)

fig = plt.figure(figsize = (12,8))
ax = fig.add_subplot(projection='3d')
plt.style.use('classic')

ax.scatter(time,ones,r*y1, color = colors1, marker = ",", s = 3)
```

    > <mpl_toolkits.mplot3d.art3d.Path3DCollection object at 0x7fc2ef197a20>

``` python
ax.scatter(time,r*x1,-ones, color = colors1, marker = ",", s = 3)
```

    > <mpl_toolkits.mplot3d.art3d.Path3DCollection object at 0x7fc2ef1a1860>

``` python
ax.scatter(time,ones,r*y2, color = colors2, marker = ",", s = 3)
```

    > <mpl_toolkits.mplot3d.art3d.Path3DCollection object at 0x7fc2ef1a1be0>

``` python
ax.scatter(time,r*x2,-ones, color = colors2, marker = ",", s = 3)
#ax.plot(time,r*x2,-ones, linestyle = '--', color = colors2[-10,:])
```

    > <mpl_toolkits.mplot3d.art3d.Path3DCollection object at 0x7fc2ef1a1f60>

``` python
ax.quiver(time,0,0,0, 0.99*r*x1, 0.99*r*y1, 
          length = 0.9, 
          normalize = False, 
          arrow_length_ratio = 0.1, 
          alpha = 1, 
          color = colors1)
```

    > <mpl_toolkits.mplot3d.art3d.Line3DCollection object at 0x7fc2ef0d82b0>

``` python
ax.quiver(time,0,0,0, 0.99*r*x2, 0.99*r*y2, 
          length = 0.9, 
          normalize = False, 
          arrow_length_ratio = 0.1, 
          alpha = 1, 
          color = colors2)
```

    > <mpl_toolkits.mplot3d.art3d.Line3DCollection object at 0x7fc2ef0d85c0>

``` python
ax.text(0.5, 1, 0.4, r'$A(t)$ $\sin(\theta)$', fontsize = 20)
```

    > Text(0.5, 1, '$A(t)$ $\\sin(\\theta)$')

``` python
ax.text(0.5, -0.9, -1, r'$A(t)$ $\cos(\theta)$', fontsize = 20)
```

    > Text(0.5, -0.9, '$A(t)$ $\\cos(\\theta)$')

``` python
ax.set_xlabel('Time')
```

    > Text(0.5, 0, 'Time')

``` python
ax.set_ylabel('Re')
```

    > Text(0.5, 0, 'Re')

``` python
ax.set_zlabel('Im')
```

    > Text(0.5, 0, 'Im')

``` python
ax.set_xlim(0,8)
```

    > (0.0, 8.0)

``` python
ax.set_ylim(-1,1)
```

    > (-1.0, 1.0)

``` python
ax.set_zlim(-1,1)
```

    > (-1.0, 1.0)

``` python
plt.show()
```

![](figures/unnamed-chunk-1-18.png)

``` python
x1_vec = x1
x1_vec = x1_vec[99]
y1_vec = y1
y1_vec = y1_vec[99]

x2_vec = x2
x2_vec = x2_vec[99]
y2_vec = y2
y2_vec = y2_vec[99]

x, y = 0.0, 0.0

fig,ax = plt.subplots(1)
fig.set_figheight(6)
fig.set_figwidth(7)
ax.scatter(r*x1,r*y1, color = colors1, marker = ".", s = 100)
```

    > <matplotlib.collections.PathCollection object at 0x7fc2ef010c88>

``` python
ax.scatter(r*x2,r*y2, color = colors2, marker = ".", s = 100)
```

    > <matplotlib.collections.PathCollection object at 0x7fc2f0aff0b8>

``` python
ax.arrow(0,0,x1_vec,y1_vec, width = 0.015, color = colors1[-1,:], head_width = 0.1)
```

    > <matplotlib.patches.FancyArrow object at 0x7fc2ef1a1470>

``` python
ax.arrow(0,0,x2_vec,y2_vec, width = 0.015, color = colors2[-1,:], head_width = 0.1)
```

    > <matplotlib.patches.FancyArrow object at 0x7fc2eef4e748>

``` python
ax.add_patch(patches.Arc((x,y), 2.3, 2.3, theta1=0.0, theta2=90.0, linestyle = '--'))
```

    > <matplotlib.patches.Arc object at 0x7fc2f0aff550>

``` python
ax.text(0.7,1, r'$\mathcal{\Delta\varphi = \frac{\pi}{2}}$', fontsize = 24)
```

    > Text(0.7, 1, '$\\mathcal{\\Delta\\varphi = \\frac{\\pi}{2}}$')

``` python
ax.text(1.18*x1_vec,y1_vec, r'$\mathcal{\varphi}_{1}$', fontsize = 20)
```

    > Text(1.18, -9.797174393178826e-16, '$\\mathcal{\\varphi}_{1}$')

``` python
ax.text(x2_vec,1.22*y2_vec, r'$\mathcal{\varphi}_{2}$', fontsize = 20)
```

    > Text(-7.354070601250002e-16, 1.22, '$\\mathcal{\\varphi}_{2}$')

``` python
ax.set_xlim(-1.35,1.35)
```

    > (-1.35, 1.35)

``` python
ax.set_ylim(-1.35,1.35)
```

    > (-1.35, 1.35)

``` python
ax.set_xlabel('Re')
```

    > Text(0.5, 0, 'Re')

``` python
ax.set_ylabel('Im')
```

    > Text(0, 0.5, 'Im')

``` python
plt.show()
```

![](figures/unnamed-chunk-1-19.png)

``` python
import sys
sys.path.insert(1, 'libs/')

import numpy as np
import scipy as sc
from scipy import io
import dynfc as dyn
import seaborn as sns
import matplotlib.pyplot as plt

ts = sc.io.loadmat('data/ts.mat')['ts']
ts = ts

RSsig = np.zeros((ts.shape[0],ts.shape[1],1))
RSsig[:,:,0] = ts

Phases, syncConn, leidaArray = dyn.run_multiPat(RSsig)
```

    > Signal filtered.
    > Phases obtained.
    > Matrices obtained.
    > Routine finished for patient no. 1.

``` python
mat1 = syncConn[:,:,0,0]

aa = plt.figure(figsize = [7,6])
ax = sns.heatmap(mat1, 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = True, 
                 cbar = True)
ax.axis('off')
```

    > (0.0, 200.0, 200.0, 0.0)

``` python
ax.tick_params(left=False, bottom=False)
plt.show()
```

![](figures/unnamed-chunk-1-23.png)

``` python
aa = plt.figure(figsize = (12/50,4))
ax = sns.heatmap(leidaArray[:,0,]/max(abs(leidaArray[:,0,])), 
                 cmap = "RdBu_r", 
                 vmin = -1, 
                 vmax = 1, 
                 square = False, 
                 cbar = False)
ax.axis('off')
```

    > (0.0, 1.0, 1180.0, 0.0)

``` python
plt.show()
```

![](figures/unnamed-chunk-1-24.png)

This document was prepared on 2021-02-14.

Package References
==================

``` r
report::cite_packages(sessionInfo())
```

-   JJ Allaire and Yihui Xie and Jonathan McPherson and Javier Luraschi
    and Kevin Ushey and Aron Atkins and Hadley Wickham and Joe Cheng and
    Winston Chang and Richard Iannone (2020). rmarkdown: Dynamic
    Documents for R. R package version 2.6. URL
    <a href="https://rmarkdown.rstudio.com" class="uri">https://rmarkdown.rstudio.com</a>.
-   Kevin Ushey, JJ Allaire and Yuan Tang (2021). reticulate: Interface
    to ‘Python’. R package version 1.18-9007.
    <a href="https://github.com/rstudio/reticulate" class="uri">https://github.com/rstudio/reticulate</a>
-   R Core Team (2020). R: A language and environment for statistical
    computing. R Foundation for Statistical Computing, Vienna, Austria.
    URL
    <a href="https://www.R-project.org/" class="uri">https://www.R-project.org/</a>.
