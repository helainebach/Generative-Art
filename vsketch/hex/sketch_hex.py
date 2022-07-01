import vsketch
class HexSketch(vsketch.SketchClass):
    # Sketch parameters:
    diameter = vsketch.Param(7, step = 1)
    canvas = vsketch.Param(8, step=1, unit="in")
    u = vsketch.Param(.7, step = 0.02, decimals=3)
    def draw(self, vsk: vsketch.Vsketch) -> None:
        vsk.size(self.canvas,self.canvas, landscape = False, center = True)
        vsk.scale("1in")
        n = int(self.diameter/self.u)
        for x in range(n):
            for y in range(n):
                r = vsk.random(4)
                if r<2:
                    vsk.stroke(1)
                    vsk.circle(x*self.u,y*self.u,self.u*.9)
                elif r<3:
                    vsk.stroke(2)
                    vsk.rect(x*self.u,y*self.u,self.u/2, self.u*.9)
                else:
                    vsk.rect(x*self.u,y*self.u,self.u*.9, self.u/2)
        vsk.circle(self.diameter/2,self.diameter/2,self.diameter)
    def finalize(self, vsk: vsketch.Vsketch) -> None:
        vsk.vpype("linemerge linesimplify reloop linesort")
if __name__ == "__main__":
    HexSketch.display()