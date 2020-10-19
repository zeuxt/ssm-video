package com.qf.videos.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.IOException;


public class ImageCut {

    /**
     * 图片切割
     *
     * @param imagePath 原图地址
     * @param x         目标切片坐标 X轴起点
     * @param y         目标切片坐标 Y轴起点
     * @param w         目标切片 宽度
     * @param h         目标切片 高度
     */
    public void cutImage(String imagePath, int x, int y, int w, int h) {
        try {
            Image img;
            ImageFilter cropFilter;
            // 读取源图像
            BufferedImage bi = ImageIO.read(new File(imagePath));
            int srcWidth = bi.getWidth();      // 源图宽度
            int srcHeight = bi.getHeight();    // 源图高度

            //若原图大小大于切片大小，则进行切割
            if (srcWidth >= w && srcHeight >= h) {
                Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);

                //如果jsp页面上展示的是原图的大小，那么此处就不计算起始坐标和宽高了，直接裁剪
                int x1 = x;
                int y1 = y;
                int w1 = w;
                int h1 = h;

                cropFilter = new CropImageFilter(x1, y1, w1, h1);
                img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cropFilter));
                BufferedImage tag = new BufferedImage(w1, h1, BufferedImage.TYPE_INT_RGB);
                Graphics g = tag.getGraphics();
                g.drawImage(img, 0, 0, null); // 绘制缩小后的图
                g.dispose();
                // 输出为文件
                ImageIO.write(tag, "JPEG", new File(imagePath));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
