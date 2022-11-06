load("render.star", "render")
load("encoding/base64.star", "base64")

ICON = base64.decode("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")


def main():
    return render.Root(
        delay=250,
        child=render.Column(
            expanded=True,
            main_align="space_around",
            cross_align="center",
            children=[
                render.Marquee(
                    width=60,
                    child=render.Text(
                        "11/5 11:00 AM - 11/7 2:00 AM",
                        color="#66ded2",
                        font="tom-thumb",
                    ),
                ),
                render.Marquee(
                    width=60,
                    child=render.Text(
                        "Spawning Grounds",
                        color="#fc9c66",
                        font="tom-thumb",
                    ),
                ),
                render.Image(ICON),
            ],
        ),
    )
