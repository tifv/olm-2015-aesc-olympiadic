import datetime

import jeolm.driver.regular

class Driver(jeolm.driver.regular.Driver):

    def select_outname(self, target, metarecord, date=None):
        for path in target.path.ancestry:
            if self.getitem(path).get('$group') is not None:
                group_path = path
                break
        else:
            return super().select_outname(target, metarecord, date=date)
        outname_pieces = []
        for part in group_path.parts:
            outname_pieces.append(part.upper())
        if isinstance(date, datetime.date):
            outname_pieces.append(date.isoformat())
        for part in target.path.parts[len(group_path.parts):]:
            outname_pieces.append(part)
        return '-'.join(outname_pieces) + '{:optional}'.format(target.flags)

