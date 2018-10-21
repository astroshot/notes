# /usr/bin/env python
# coding=utf-8
import click


def load_file(file_path, keyword):
    """Kindle notes are kept in file `My Clippings.txt`, which is located in your device.
    Your notes are saved as the following format:
        $BOOK_NAME
        - your reading position
        \n
        contents you marked and intent to export
        =========

    This scripts will search `keyword` in $BOOK_NAME, and output contents you marked if $BOOK_NAME contains `keyword`.
    Then save contents in current directory using name `keyword`.


    :param file_path: kindle notes path
    :param keyword: book_name
    """
    notes = []
    with open(file_path, 'r') as f:
        while True:
            line = f.readline()
            if not line:  # end of file
                break

            if keyword in line:
                i = 0
                while i < 2:  # kindle notes structure
                    skip_line = f.readline()
                    i += 1
                    if not skip_line:
                        break
                else:
                    line = f.readline()
                    notes.append(line)

    output_file = '{}.txt'.format(keyword)
    with open(output_file, 'w') as outfile:
        for line in notes:
            outfile.write('{}\n'.format(line))


@click.command()
@click.option('--infile', help=u'文件路径')
@click.option('--word', help=u'查找文字')
def main(infile, word):
    load_file(infile, word)


if __name__ == '__main__':
    main()
