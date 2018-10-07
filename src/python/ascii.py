# coding=utf-8
from PIL import Image
import click


char_str = 'abcdefghijklmnopqrstuvwxyz'


def rgb2char(r, g, b):
    """Convert r, g, b value to char
    :param r: red value
    :param g: green value
    :param b: blue value
    """
    length = len(char_str)
    gray = int(0.2126 * r + 0.7152 * g + 0.0722 * b)
    unit = (256.0 + 1) / length
    idx = int(gray / unit)
    return char_str[idx]


def pre_convert(image_path, scale=100):
    """pre_convert converts image to gray and compress image
    :param image_path: path of image
    :param scale: compress scale, default value is 100
    """
    img = Image.open(image_path)
    w, h = img.size
    max_len = w if w > h else h
    actual_scale = max_len / scale
    w, h = int(w / actual_scale), int(h / actual_scale)
    img = img.resize((w, h))
    return img


def convert(img_obj, output_file):
    txt = []
    w, h = img_obj.size
    for i in range(h):
        empty_list = []
        for j in range(w):
            empty_list.append(rgb2char(*img_obj.getpixel((j, i))))
        empty_list.append('\n')
        line = ''.join(empty_list)
        txt.append(line)
    text = ''.join(txt)

    with open(output_file, 'w+', encoding='utf-8') as f:
        f.write(text)


@click.command()
@click.option('--input_file', help=u'input file path')
@click.option('--output_file', help=u'output file path')
def main(input_file, output_file):
    img_obj = pre_convert(input_file)
    convert(img_obj, output_file)


if __name__ == '__main__':
    main()
